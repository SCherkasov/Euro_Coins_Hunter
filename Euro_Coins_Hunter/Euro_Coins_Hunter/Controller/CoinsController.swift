//
//  CoinsController.swift
//  Euro_Coins_Hunter
//
//  Created by Stanislav Cherkasov on 3/16/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import UIKit

class CoinsController: UICollectionViewController {
  
  var coinStore = CoinStore()
  var selectedCountry: Country?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.coinStore.loadCoins()
    self.coinStore.filterCoins(with: selectedCountry!)
  }
  
  // MARK: UICollectionViewDataSource
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int
  {
    return self.coinStore.coins.count + 1
  }
  
  override func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                  for: indexPath) as! CoinCell
    
    if indexPath.row < self.coinStore.coins.count {
      cell.nameLabel.text = self.coinStore.coins[indexPath.row].name
      cell.thumb.image = UIImage(named: self.coinStore.coins[indexPath.row].image)
    } else {
      if indexPath.row == self.coinStore.coins.count {
        cell.nameLabel.text = selectedCountry?.name
        cell.thumb.image = UIImage(named: (selectedCountry?.flagImageName)!)
      }
    }
    return cell
  }
}
