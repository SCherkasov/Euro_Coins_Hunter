//
//  RegisterViewController.swift
//  PassView
//
//  Created by Stanislav Cherkasov on 3/10/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet var repeatPasswordTextField: UITextField!
  @IBOutlet var userNameTextField: UITextField!
  @IBOutlet var passwordTextField: UITextField!
  @IBOutlet var registerButonOutlet: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    userNameTextField.resignFirstResponder()
    passwordTextField.resignFirstResponder()
    repeatPasswordTextField.resignFirstResponder()
    passwordTextField.delegate = self
    repeatPasswordTextField.delegate = self
  }
  
  //passwordTextField & repeatPasswordTextField sets a range of max
  //number to 4
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let currentText = textField.text ?? ""
    guard let stringRange = Range(range, in: currentText) else { return false }
    
    let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
    
    return updatedText.count <= 4
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
