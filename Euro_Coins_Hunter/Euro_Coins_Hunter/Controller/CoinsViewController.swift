//
//  CoinsViewController.swift
//  Euro Coins Hunter
//
//  Created by Stanislav Cherkasov on 31.07.2018.
//  Copyright © 2018 Stanislav Cherkasov. All rights reserved.
//

import UIKit

class CoinsViewController: UIViewController, CoinsCellDelegate {
  
  enum EditBarButtonItem {
    case activate
    case deactivate
  }
  
  @IBOutlet var coinCollectionView: UICollectionView!
  
  var coinStore = CoinStore()
  var selectedCountry: Country?
  var editBarButtonItemState = EditBarButtonItem.deactivate

  override func viewDidLoad() {
    super.viewDidLoad()
    self.coinStore.loadCoins()
    self.coinStore.filterCoins(with: selectedCountry!)
    
    let nib = UINib(nibName: "CoinsCollectionViewCell", bundle: nil)
    coinCollectionView.register(nib, forCellWithReuseIdentifier:
      "CoinsCollectionViewCell")
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editAction))
    navigationItem.rightBarButtonItem?.tintColor = UIColor.white
    
    setupLayoutToCollectionView()
  }
  
  func setupLayoutToCollectionView() {
    let itemSize = (UIScreen.main.bounds.width - 40) / 3
    
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    layout.itemSize = CGSize(width: itemSize, height: itemSize + 30)
    
    layout.minimumInteritemSpacing = 8
    layout.minimumLineSpacing = 8
    
    coinCollectionView.collectionViewLayout = layout
  }
  
  @objc func editAction() {
    switch self.editBarButtonItemState {
    case .activate:
      self.editBarButtonItemState = .deactivate
      navigationItem.rightBarButtonItem?.title = "Edit"
      self.setCoinCellViewButtonState(true)
    case .deactivate:
      self.editBarButtonItemState = .activate
      navigationItem.rightBarButtonItem?.title = "Save"
      self.setCoinCellViewButtonState(false)
    }
  }
  
  func setCoinCellViewButtonState(_ isHidden: Bool) {
    let numberOfItems = self.coinCollectionView.numberOfItems(inSection: 0)
    if numberOfItems == 0 {
      return
    }
    
    _ = Array(0...numberOfItems)
      .map { IndexPath.init(row: $0, section: 0) }
      .map {
        if let cell = self.coinCollectionView.cellForItem(at: $0) as? CoinsCollectionViewCell {
          cell.setButtonHiddenState(isHidden)
        }
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
  
  func updateButtonFor(cell: CoinsCollectionViewCell, coinAtIndexPath indexPath: IndexPath) {
    let title = self.coinStore.coins[indexPath.row].isLocked ? "Unlock" : "Lock";
    cell.button.setTitle(title, for: UIControlState.normal)
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
  {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoinsCollectionViewCell", for: indexPath)
        as! CoinsCollectionViewCell
      cell.index = indexPath.row
      
      if indexPath.row < self.coinStore.coins.count {
        cell.coinNameLabel.text = self.coinStore.coins[indexPath.row].name
        
        let image = UIImage(named: self.coinStore.coins[indexPath.row].image)
        cell.coinImage.image = image
        
        self.updateButtonFor(cell: cell, coinAtIndexPath: indexPath)
  
        cell.delegate = self
      } else {
        if indexPath.row == self.coinStore.coins.count {
          cell.coinNameLabel.text = selectedCountry?.name
    
          let image = UIImage(named: (selectedCountry?.flagImageName)!)
          cell.coinImage.image = image
        }
      }
      return cell
  }
  
  func coinCell(_ cell: CoinsCollectionViewCell, with index: Int, didTouchButton button: UIButton) {
    let indexPath = IndexPath.init(item: index, section: 0)
    
    let isLocked = self.coinStore.coins[index].setNextState()
    
    var onCompletion: (() -> ())?

    onCompletion = {
      self.updateButtonFor(cell: cell, coinAtIndexPath: indexPath)
    }
    
    if isLocked {
      cell.transition(to: .closed, onCompletion: onCompletion)
    } else {
      cell.transition(to: .opened, onCompletion: onCompletion)
    }
  }
}

extension CoinsViewController: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if indexPath.item == self.coinStore.coins.count {
      return
    } else {
      if !coinStore.coins[indexPath.row].isLocked {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        if let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController")
          as? DetailViewController
        {
          let coinDetailPost = self.coinStore.coins[indexPath.row] as Coin
          detailVC.selectedCoin = coinDetailPost
          self.navigationController?.pushViewController(detailVC, animated: true)
        }
      }
    }
  }
}

