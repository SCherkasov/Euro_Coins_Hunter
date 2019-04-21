//
//  LaunchViewController.swift
//  Euro_Coins_Hunter
//
//  Created by Stanislav Cherkasov on 4/21/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
  
  @IBOutlet var oneEuroButtonOutlet: UIButton!
  @IBOutlet var blackView: UIView!
  
  var sec = LogInViewController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    oneEuroButtonOutlet.alpha = 0
    blackView.alpha = 1
    animationAppear()
  }
  
  func animationAppear() {
    
    UIView.animate(withDuration: 3.0,
                   delay: 3.0,
                   options: [],
                   animations: {
                    self.blackView.alpha = 0
    }, completion: nil)
    
    UIView.animate(withDuration: 3.0,
                   delay: 3.5,
                   options: [],
                   animations: {
                    self.oneEuroButtonOutlet.alpha = 1
    })
    
  }
  
  @IBAction func oneEuroButtonPressed(_ sender: UIButton) {
    
    oneEuroButtonOutlet.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
    
    UIView.animate(withDuration: 1.0,
                   delay: 0,
                   usingSpringWithDamping: 0.4,
                   initialSpringVelocity: 7.5,
                   options: .allowUserInteraction,
                   animations: { [weak self] in
                    self?.oneEuroButtonOutlet.transform = .identity
      }, completion: nil)
    
    UIView.animate(withDuration: 3.0,
                   delay: 1.0,
                   options: [],
                   animations: {
                    self.blackView.alpha = 1
    }, completion: nil)
    
    UIView.animate(withDuration: 2.5,
                   delay: 1.0,
                   options: [],
                   animations: {
                    self.oneEuroButtonOutlet.alpha = 0
                    
    })
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let secondVC = storyboard.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
      self.present(secondVC, animated: true, completion: nil)
    }
  }
  
}
