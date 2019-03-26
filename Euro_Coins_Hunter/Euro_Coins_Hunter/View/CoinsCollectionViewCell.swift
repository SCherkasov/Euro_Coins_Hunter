//
//  CoinsCollectionViewCell.swift
//  Euro Coins Hunter
//
//  Created by Stanislav Cherkasov on 31.07.2018.
//  Copyright © 2018 Stanislav Cherkasov. All rights reserved.
//

import UIKit

class CoinsCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet var coinImage: UIImageView!
  @IBOutlet var coinNameLabel: UILabel!
  
  @IBOutlet var welcomeView: UIView!
  
  var coinsViewController: CoinsViewController?
  
  var imageViews: [UIImageView] = []
  
  var leftImageView: UIImageView {
    return self.imageViews[0]
  }
  
  var rightImageView: UIImageView {
    return self.imageViews[1]
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
  
    //setup lock image
    self.imageViews = UIImage(named: "lock")!.divideIntoTwoVertialParts()
      .map {
        UIImageView.init(image: $0)
    }
    
    let width = self.coinImage.frame.width
    imageViews[0].frame = CGRect.init(
      x: 0,
      y: 0,
      width: width / 2.0,
      height: width
    )
    
    imageViews[1].frame = CGRect.init(
      x: width / 2.0,
      y: 0,
      width: width / 2.0,
      height: width
    )
    
    imageViews[0].alpha = 0.5
    imageViews[1].alpha = 0.5
    
    self.coinImage.addSubview(imageViews[0])
    self.coinImage.addSubview(imageViews[1])
    
  }
}
