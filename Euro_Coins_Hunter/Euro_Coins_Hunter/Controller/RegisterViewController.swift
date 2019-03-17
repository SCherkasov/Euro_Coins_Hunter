//
//  RegisterViewController.swift
//  PassView
//
//  Created by Stanislav Cherkasov on 3/10/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
  
  @IBOutlet var repeatPasswordTextField: UITextField!
  @IBOutlet var userNameTextField: UITextField!
  @IBOutlet var passwordTextField: UITextField!
  @IBOutlet var registerButonOutlet: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    userNameTextField.resignFirstResponder()
    passwordTextField.resignFirstResponder()
    repeatPasswordTextField.resignFirstResponder()
  }
  
  @IBAction func registerButtonAction(_ sender: Any) {
    
    let userName = userNameTextField.text
    let userPassword = passwordTextField.text
    let userRepeatPassword = repeatPasswordTextField.text
    
    if (userName == "" || userPassword == "" || userRepeatPassword == "") {
      displayAllertMessage("All fields are required")
    }
    
    if (userPassword != userRepeatPassword) {
      displayAllertMessage("Password do not match")
    }
    
    UserDefaults.standard.set(userName, forKey: "userName")
    UserDefaults.standard.set(userPassword, forKey: "userPassword")
    UserDefaults.standard.synchronize()
    
    self.dismiss(animated: true, completion: nil)
  }
  
  func displayAllertMessage(_ message: String) {
    let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
    alertController.addAction(okAction)
    present(alertController, animated: true, completion: nil )
  }
  
  @IBAction func backToLigInScreen(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
}
