//
//  SettingsTableViewController.swift
//  Euro_Coins_Hunter
//
//  Created by Stanislav Cherkasov on 4/5/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupBackButton()
  }
  
  func setupBackButton() {
    
    self.navigationItem.setHidesBackButton(true, animated:false)
    
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
    
    if let imgBackArrow = UIImage(named: "exit") {
      imageView.image = imgBackArrow
    }
    view.addSubview(imageView)
    
    let backTap = UITapGestureRecognizer(target: self, action: #selector(backToMain))
    view.addGestureRecognizer(backTap)
    
    let leftBarButtonItem = UIBarButtonItem(customView: view )
    self.navigationItem.leftBarButtonItem = leftBarButtonItem
  }
  
  @objc func backToMain() {
    self.navigationController?.popViewController(animated: true)
  }
  
  override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    switch section {
    case 0:
      let header = view as! UITableViewHeaderFooterView
      header.backgroundView?.backgroundColor = UIColor.black
      header.textLabel?.textColor = .white
      header.textLabel?.text = "Version"
      header.textLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
    case 1:
      let header = view as! UITableViewHeaderFooterView
      header.backgroundView?.backgroundColor = UIColor.black
      header.textLabel?.textColor = .white
      header.textLabel?.text = "Language"
      header.textLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
    case 2:
      let header = view as! UITableViewHeaderFooterView
      header.backgroundView?.backgroundColor = UIColor.black
      header.textLabel?.textColor = .white
      header.textLabel?.text = "Log in"
      header.textLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
    case 3:
      let header = view as! UITableViewHeaderFooterView
      header.backgroundView?.backgroundColor = UIColor.black
      header.textLabel?.textColor = .white
      header.textLabel?.text = "Account"
      header.textLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
    default:
      return
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 2000.00
    }
  }
  
  @IBAction func logOutPressed(sender: UIButton) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let secondVC = storyboard.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
    self.present(secondVC, animated: true, completion: nil)
  }
}
