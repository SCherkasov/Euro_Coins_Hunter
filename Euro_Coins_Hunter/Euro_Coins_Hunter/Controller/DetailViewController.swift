//
//  DetailViewController.swift
//  Euro_Coins_Hunter
//
//  Created by Stanislav Cherkasov on 3/17/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

  @IBOutlet var detailTableView: UITableView!
  @IBOutlet var headerView: DetailHeaderView!
  
  var coinStore = CoinStore()
  var selectedCoin: Coin?
  
  override func viewDidLoad() {
        super.viewDidLoad()
    let image = UIImage(named: (selectedCoin?.image)!)
    headerView.detailCoinImage.image = image
    headerView.detailCoinImage.layer.cornerRadius = headerView.detailCoinImage.frame.size.height / 1.8
    headerView.detailCoinImage.clipsToBounds = true
   //headerView.detailCoinImage.image = UIImage(named: (selectedCoin?.image)!)
    }
}

extension DetailViewController: UITableViewDataSource {
 
  
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell0", for: indexPath) as! DetailCountryNameTableViewCell
      cell.nameCountry.text = "Germany"
      
      return cell
      
   
    default:
      fatalError("Failed")
    }
    
  }

}
