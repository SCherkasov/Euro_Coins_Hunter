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
  var lockImage: CoinsCollectionViewCell?
  
  var doorSate = DoorState.closed
  var editBarButtonItemState = EditBarButtonItem.deactivate
  
  enum DoorState {
    case opened
    case closed
  }
  
  enum EditBarButtonItem {
    case activate
    case deactivate
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let nib = UINib(nibName: "CoinsCollectionViewCell", bundle: nil)
    coinCollectionView.register(nib, forCellWithReuseIdentifier:
      "CoinsCollectionViewCell")
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editAction))
    navigationItem.rightBarButtonItem?.tintColor = UIColor.white
    
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
  
    func makeAction() {
    switch self.doorSate {
    case .opened:
      self.doorSate = .closed
      self.transition(to: .closed)
    case .closed:
      self.doorSate = .opened
      self.transition(to: .opened)
    }
  }
  
  @objc func editAction() {
    switch self.editBarButtonItemState {
    case .activate:
      self.editBarButtonItemState = .deactivate
      navigationItem.rightBarButtonItem?.title = "Edit"
      lockImage?.buttonOnCoinCell.isHidden = false
    case .deactivate:
      self.editBarButtonItemState = .activate
      navigationItem.rightBarButtonItem?.title = "Save"
      lockImage?.buttonOnCoinCell.isHidden = true
    }
  }
  
  func transition(to nextDoorState: DoorState) {
    if nextDoorState == .opened {
      UIView.animate(withDuration: 1.0, delay: 0.3, options: [], animations: {
        self.lockImage!.imageViews[0].center.x -= self.lockImage!.coinImage.bounds.width / 2
        self.lockImage!.imageViews[1].center.x += self.lockImage!.coinImage.bounds.width / 2
        self.lockImage!.imageViews[0].alpha = 0.0
        self.lockImage!.imageViews[1].alpha = 0.0
      }, completion: nil)
    } else {
      UIView.animate(withDuration: 1.0, delay: 0.3, options: [], animations: {
        self.lockImage!.imageViews[0].center.x += self.lockImage!.coinImage.bounds.width / 2
        self.lockImage!.imageViews[1].center.x -= self.lockImage!.coinImage.bounds.width / 2
        self.lockImage!.imageViews[0].alpha = 0.5
        self.lockImage!.imageViews[1].alpha = 0.5
      }, completion: nil)
    }
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
        
        let image = UIImage(named: self.coinStore.coins[indexPath.row].image)
        cell.coinImage.image = image
        cell.coinImage.layer.cornerRadius = cell.coinImage.frame.size.height / 2
        cell.coinImage.clipsToBounds = true
      } else {
        if indexPath.row == self.coinStore.coins.count {
          cell.coinNameLabel.text = selectedCountry?.name
          
          let image = UIImage(named: (selectedCountry?.flagImageName)!)
          cell.coinImage.image = image
          cell.coinImage.layer.cornerRadius = cell.coinImage.frame.size.height / 2
          cell.coinImage.clipsToBounds = true
        }
      }
      return cell
  }
}

extension CoinsViewController: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if indexPath.item == 8 {
      return
    } else {
      if editBarButtonItemState == .activate {
    let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
    if let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController")
      as? DetailViewController
    {
      let coinDetailPost = self.coinStore.coins[indexPath.row] as Coin
      detailVC.selectedCoin = coinDetailPost
      self.navigationController?.pushViewController(detailVC, animated: true)
    } else {
      return
        }
  }
  }
  }
}
