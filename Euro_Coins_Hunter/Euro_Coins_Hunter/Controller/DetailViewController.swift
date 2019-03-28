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
  
  var tapGesture: UITapGestureRecognizer!
  
  override func viewDidLoad() {
        super.viewDidLoad()
    let image = UIImage(named: (selectedCoin?.image)!)
    headerView.detailCoinImage.image = image
    headerView.detailCoinImage.layer.cornerRadius = headerView.detailCoinImage.frame.size.height / 2
    headerView.detailCoinImage.clipsToBounds = true
    
    self.detailTableView.separatorStyle = .none
    
    // setup TapGestureRecognizer
    self.tapGesture = UITapGestureRecognizer(target: self, action: #selector(transit))
    self.headerView.detailCoinImage.isUserInteractionEnabled = true
    self.headerView.detailCoinImage.addGestureRecognizer(tapGesture)
  }
  
  @objc func transit() {
    let detailCoinVC = UIStoryboard(name: "Main", bundle: nil)
    let destVC = detailCoinVC.instantiateViewController(withIdentifier: "DetailCoinZoomViewController") as! DetailCoinZoomViewController
    destVC.detCoiImage = headerView.detailCoinImage.image!
    self.navigationController?.pushViewController(destVC, animated: true)
  }
}

extension DetailViewController: UITableViewDataSource {
 
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell0",
                                               for: indexPath) as! NameCell
      cell.nameCountry.text = selectedCoin?.country.name
      
      return cell
     
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell1",
                                               for: indexPath) as! YearCell
      cell.yearCoins.text = selectedCoin?.year
      
      return cell
      
    case 2:
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell2",
                                               for: indexPath) as! DesignerCell
      cell.designerCoin.text = selectedCoin?.designer
      
      return cell
      
    case 3:
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell3",
                                               for: indexPath) as! MintCell
      cell.mintCoin.text = selectedCoin?.mint
      
      return cell
      
    case 4:
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell4",
                                               for: indexPath) as! MaterialCell
      cell.materialCoin.text = selectedCoin?.material
      
      return cell
      
    case 5:
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell5",
                                               for: indexPath) as! WeightCell
      cell.weightCoin.text = selectedCoin?.weight
      
      return cell
      
    case 6:
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell6",
                                               for: indexPath) as! DiameterCell
      cell.diameterCoin.text = selectedCoin?.diameter
      
      return cell
      
    case 7:
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell7",
                                               for: indexPath) as! ThicknessCell
      cell.thicknessCoin.text = selectedCoin?.thickness
      
      return cell
      
    case 8:
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell8",
                                               for: indexPath) as! HerdCell
      cell.herdCoin.text = "Smooth"
      
      return cell
      
    case 9:
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell9",
                                               for: indexPath) as! DescriptionCell
      cell.descriptionAboutCoin.text = "Coat of arms of the Cardinal Camelot, temporary head of the Vatican. Text around the coat of arms: SEDE VACANTE MMV. Between the emblem and the year of issue of the coin (MMV) there is a mint mark (letter “R”). To the left of the emblem there is the artist's designation “D.LONGO”, to the right - the engraver “M.A.C. INC.  Along the flange, 12 stars are depicted (above) and the name of the issuing state “CITTA` DEL VATICANO” (below) is indicated."
      
      cell.descriptionAboutCoin.translatesAutoresizingMaskIntoConstraints = true
      cell.descriptionAboutCoin.sizeToFit()
      cell.descriptionAboutCoin.isScrollEnabled = false
      cell.descriptionAboutCoin.backgroundColor = UIColor.black
      cell.descriptionAboutCoin.textColor = UIColor.white
   
      return cell
      
    default:
      fatalError("Failed")
    }
  }
}
