//
//  LoginViewController.swift
//  Euro_Coins_Hunter
//
//  Created by gvr on 3/27/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  @IBOutlet weak var digitsView: UIView!
  var buttons = [UIButton]()
  @IBOutlet weak var registerButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let emptySpaceButtonLabel = "-"
    self.buttons = ((Array(1...9)).map { "\($0)" } + [emptySpaceButtonLabel, "0", emptySpaceButtonLabel])
      .map { (label: String) -> UIButton in
        let button = UIButton.init(frame: CGRect.zero)
        button.setTitle(label, for: UIControlState.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 32, weight: UIFont.Weight.thin)
        
        button.setTitleColor(UIColor.white, for: UIControlState.normal)
        button.setTitleColor(UIColor.black, for: UIControlState.highlighted)
        button.backgroundColor = UIColor.black
        return button
      }
      .map { (button: UIButton) in
        button.addTarget(self, action: #selector(onDigitButtonTouchDown(_:)), for: UIControlEvents.touchDown)
        button.addTarget(self, action: #selector(onDigitButtonTouchUp(_:)), for: UIControlEvents.touchUpInside)
        if (button.titleLabel?.text != emptySpaceButtonLabel) {
          self.digitsView.addSubview(button)
        }
        return button
      }
    
    self.registerButton.setTitleColor(UIColor.white, for: UIControlState.normal)
    self.registerButton.setTitleColor(UIColor.black, for: UIControlState.highlighted)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    let spacing = 20.0
    
    let baseViewBounds = self.digitsView.bounds
    print("\(baseViewBounds)")
    
    let cellSize = (Double(baseViewBounds.size.width) - (3.0 * spacing)) / 3.0
    
    for (index, element) in self.buttons.enumerated() {
      let row = index / 3
      let column = index % 3
      
      let frame = CGRect.init(
        x: spacing / 2.0 + Double(column) * (cellSize + spacing),
        y: spacing / 2.0 + Double(row) * (cellSize + spacing),
        width: cellSize,
        height: cellSize)
      
      element.frame = frame
      
      element.layer.cornerRadius = frame.width / 2.0
      element.layer.borderWidth = 1
      element.layer.borderColor = UIColor.white.cgColor
      
      print("\(frame)")
      
    }
  }
  
  @objc
  func onDigitButtonTouchDown(_ sender: UIButton) {
    print("touchedDown \(sender.titleLabel?.text)")
    sender.backgroundColor = UIColor.white
    sender.titleLabel?.textColor = UIColor.green
  }
  
  @objc
  func onDigitButtonTouchUp(_ sender: UIButton) {
    print("touchedUp \(sender.titleLabel?.text)")
    sender.backgroundColor = UIColor.black
    sender.titleLabel?.textColor = UIColor.white
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
}
