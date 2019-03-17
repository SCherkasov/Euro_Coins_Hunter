//
//  FlagsViewController.swift
//  Euro Coins Hunter
//
//  Created by Stanislav Cherkasov on 29.07.2018.
//  Copyright © 2018 Stanislav Cherkasov. All rights reserved.
//

import UIKit

class FlagsViewController: UIViewController {
  
  @IBOutlet var flagCollectionView: UICollectionView!
  
  var coinStore = CoinStore()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.coinStore.loadCoins()
    
    let nib = UINib(nibName: "FlagsCollectionViewCell", bundle: nil)
    flagCollectionView.register(nib,
                                forCellWithReuseIdentifier:
      "FlagsCollectionViewCell")
    
    setupLayoutToCollectionView()
  }
  
  func setupLayoutToCollectionView() {
    let itemSize = UIScreen.main.bounds.width / 3
    
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    layout.itemSize = CGSize(width: itemSize, height: itemSize)
    
    layout.minimumInteritemSpacing = 0
    layout.minimumLineSpacing = 0
    
    flagCollectionView.collectionViewLayout = layout
  }
}

extension FlagsViewController: UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return self.coinStore.countries.count
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    if segue.identifier == "showCoins" {

      let coinsVC = segue.destination as! CoinsViewController
      let cell = sender as! FlagsCollectionViewCell
      let indexPath = self.flagCollectionView.indexPath(for: cell)
      let countryPost = self.coinStore.countries[(indexPath?.row)!] as Country
      coinsVC.selectedCountry = countryPost
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt
    indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FlagsCollectionViewCell", for: indexPath) as! FlagsCollectionViewCell
    
    cell.flagNameLabel.text = self.coinStore.countries[indexPath.row].name
    cell.flagImage.image = UIImage(named: self.coinStore.countries[indexPath.row].flagImageName)
    
    return cell
  }
}

