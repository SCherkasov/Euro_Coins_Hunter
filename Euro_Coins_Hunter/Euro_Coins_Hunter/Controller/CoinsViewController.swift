//
//  CoinsViewController.swift
//  Euro Coins Hunter
//
//  Created by Stanislav Cherkasov on 31.07.2018.
//  Copyright © 2018 Stanislav Cherkasov. All rights reserved.
//

import UIKit

class CoinsViewController: UIViewController {
  
  @IBOutlet var coinCollectionView: UICollectionView!
  
  var coinStore = CoinStore()
   var selectedCountry: Country?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let nib = UINib(nibName: "CoinsCollectionViewCell", bundle: nil)
    coinCollectionView.register(nib, forCellWithReuseIdentifier:
      "CoinsCollectionViewCell")
    
    self.coinStore.loadCoins()
    self.coinStore.filterCoins(with: selectedCountry!)
    
    setupLayoutToCollectionView()
    
  }
  
  func setupLayoutToCollectionView() {
    let itemSize = UIScreen.main.bounds.width / 3
    
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    layout.itemSize = CGSize(width: itemSize, height: itemSize)
    
    layout.minimumInteritemSpacing = 0
    layout.minimumLineSpacing = 0
    
    coinCollectionView.collectionViewLayout = layout
  }
}

extension CoinsViewController: UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return self.coinStore.coins.count + 1
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) ->
    UICollectionViewCell {
      
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoinsCollectionViewCell", for: indexPath) as!
      CoinsCollectionViewCell
      
      if indexPath.row < self.coinStore.coins.count {
        cell.coinNameLabel.text = self.coinStore.coins[indexPath.row].name
        cell.coinImage.image = UIImage(named: self.coinStore.coins[indexPath.row].image)
      } else {
        if indexPath.row == self.coinStore.coins.count {
          cell.coinNameLabel.text = selectedCountry?.name
          cell.coinImage.image = UIImage(named: (selectedCountry?.flagImageName)!)
        }
      }
      return cell
  }
  
}
