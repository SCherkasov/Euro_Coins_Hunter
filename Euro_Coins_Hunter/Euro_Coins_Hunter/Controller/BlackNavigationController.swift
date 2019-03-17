//
//  BlackNavigationController.swift
//  Euro Coins Hunter
//
//  Created by Stanislav Cherkasov on 29.07.2018.
//  Copyright © 2018 Stanislav Cherkasov. All rights reserved.
//

import UIKit

class BlackNavigationController: UINavigationController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationBar.setBackgroundImage(UIImage(), for: .default)
    self.navigationBar.shadowImage = UIImage()
    self.navigationBar.tintColor = UIColor.white
  }
}
