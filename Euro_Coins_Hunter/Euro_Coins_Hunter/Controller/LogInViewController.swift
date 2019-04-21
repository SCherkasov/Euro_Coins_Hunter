//
//  ViewController.swift
//  PassView
//
//  Created by Stanislav Cherkasov on 3/8/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import UIKit
import LocalAuthentication
import AudioToolbox

class LogInViewController: UIViewController {
  
  @IBOutlet var oneButton: UIButton!
  @IBOutlet var twoButton: UIButton!
  @IBOutlet var threeButton: UIButton!
  @IBOutlet var fourButton: UIButton!
  @IBOutlet var fiveButton: UIButton!
  @IBOutlet var sixButton: UIButton!
  @IBOutlet var sevenButton: UIButton!
  @IBOutlet var eightButton: UIButton!
  @IBOutlet var nineButton: UIButton!
  @IBOutlet var zeroButton: UIButton!
  @IBOutlet var touchButton: UIButton!
  @IBOutlet var invisibleButton: UIButton!
  
  @IBOutlet var keyCode1: UIView!
  @IBOutlet var keyCode2: UIView!
  @IBOutlet var keyCode3: UIView!
  @IBOutlet var keyCode4: UIView!
  
  @IBOutlet var blackView: UIView!
  
  @IBOutlet var userNameAfterRegisterLabel: UILabel!
  
  var inputKeycode: [Int] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setButton(for: oneButton)
    setButton(for: twoButton)
    setButton(for: threeButton)
    setButton(for: fourButton)
    setButton(for: fiveButton)
    setButton(for: sixButton)
    setButton(for: sevenButton)
    setButton(for: eightButton)
    setButton(for: nineButton)
    setButton(for: zeroButton)
    
    setupKeycodes(keyCode1, for: .white)
    setupKeycodes(keyCode2, for: .white)
    setupKeycodes(keyCode3, for: .white)
    setupKeycodes(keyCode4, for: .white)
    
    self.inputKeycode = []
    
    touchButton  = UIButton(type: .custom)
    if let image = UIImage(named: "Touch_ID.png") {
      touchButton.setImage(image, for: .normal)
    }
    
    blackView.alpha = 1
    animation()
    
    authWithTouchID()
    self.navigationItem.hidesBackButton = true
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    setupUserName()
  }
  
  // animate appear LogIn screen
  func animation() {
    DispatchQueue.main.asyncAfter(deadline: .now()) {
      UIView.animate(withDuration: 3, delay: 0.5, options: [], animations: {
        self.blackView.alpha = 0
      }, completion: nil)
    }
  }
  
  func setupUserName() {
    let userName = UserDefaults.standard.string(forKey: "userName")
    
    if let newUserName = userName {
      self.userNameAfterRegisterLabel.text = ("Hi, \(newUserName)")
    }
   
  }
  
  func setupKeycodes(_ keyCode: UIView, for color: UIColor) {
    keyCode.layer.cornerRadius = keyCode.bounds.size.height / 2
    keyCode.backgroundColor = color
  }
  
  func inputKeycodeAction() {
    if inputKeycode.count == 1 {
      setupKeycodes(keyCode1, for: .red)
    }
    
    if inputKeycode.count == 2 {
      setupKeycodes(keyCode2, for: .red)
    }
    
    if inputKeycode.count == 3 {
      setupKeycodes(keyCode3, for: .red)
    }
    
    if inputKeycode.count == 4 {
      
      // check if the pass is correct
      let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword")
      
      let stringArray = inputKeycode.map { String($0) }
      
      if stringArray.joined() == userPasswordStored {
        UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
        UserDefaults.standard.synchronize()
        setupKeycodes(keyCode4, for: .red)
        performSegue(withIdentifier: "goToMainView", sender: self)
        
      } else {
        
        //animatoon shake
        keyCode1.shake()
        keyCode2.shake()
        keyCode3.shake()
        keyCode4.shake()
        
        // add error vibration
        let systemSoundId: SystemSoundID = 1102
        AudioServicesPlaySystemSound(systemSoundId)
        
        // setup keycodes to white color
        inputKeycode.removeAll()
        setupKeycodes(keyCode3, for: .white)
        setupKeycodes(keyCode2, for: .white)
        setupKeycodes(keyCode1, for: .white)
        setupKeycodes(keyCode4, for: .white)
        
      }
    }
  }
  
  func setButton(for button: UIButton!) {
    button.backgroundColor = .clear
    button.layer.cornerRadius = button.bounds.size.height / 2
    button.clipsToBounds = true
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor.white.cgColor
  }
  
  // alert controller
  func showAlertController(_ message: String) {

      let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
      let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
      alertController.addAction(okAction)
      self.present(alertController, animated: true, completion: nil)
    
  }
  
  // authorisation with touch id
  func authWithTouchID() {
      let context = LAContext()
      
      if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                   error: nil) {
        let reason = "Authenticate with Touch ID"
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                               localizedReason: reason, reply: { (succes, error) in
                                if succes {
                                  
                                  self.performSegue(withIdentifier: "goToMainView",
                                                    sender: self)
                                }
        }
        )}
      else {
        self.showAlertController("Touch ID not available")
      }
  }
  
  @IBAction func pressedButtotToAuth(_ sender: Any) {
    authWithTouchID()
  }
  
  @IBAction func numbers(_ sender: UIButton) {
    
    if sender.tag - 1 <= 10 {
      inputKeycode.append(sender.tag - 1)
      inputKeycodeAction()
    }
  }
}

// make shake effect
extension UIView {
  func shake() {
    let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
    animation.duration = 0.6
    animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
    layer.add(animation, forKey: "shake")
  }
}
