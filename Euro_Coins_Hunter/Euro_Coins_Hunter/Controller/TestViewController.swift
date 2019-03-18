//
//  TestViewController.swift
//  Euro_Coins_Hunter
//
//  Created by gvr on 3/17/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    override func loadView() {
        let views = Bundle.main.loadNibNamed("LoginView",
                                             owner: self,
                                             options: nil)
        
        if let loginView = views?.first as? LoginView {
            self.view = loginView
        } else {
            self.view = UIView();
        }
    }
    
    override func viewDidLoad() {
    }
}
