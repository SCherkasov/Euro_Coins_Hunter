//
//  AboutTheAppViewController.swift
//  Euro_Coins_Hunter
//
//  Created by Stanislav Cherkasov on 5/16/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import UIKit

class AboutTheAppViewController: UIViewController {

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
      imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
      imageView.tintColor = UIColor.lightGray
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
}
