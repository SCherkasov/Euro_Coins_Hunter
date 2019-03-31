//
//  CoinsCollectionViewCell.swift
//  Euro Coins Hunter
//
//  Created by Stanislav Cherkasov on 31.07.2018.
//  Copyright © 2018 Stanislav Cherkasov. All rights reserved.
//

import UIKit

protocol CoinsCellDelegate {
  func coinCell(_ cell: CoinsCollectionViewCell, with index:Int, didTouchButton button: UIButton)
}

class CoinsCollectionViewCell: UICollectionViewCell {
  
  public enum DoorState {
    case opened
    case closed
  }
  
  var doorSate = DoorState.closed
  var delegate: CoinsCellDelegate?
  var index: Int!
  
  @IBOutlet var coinImage: UIImageView!
  @IBOutlet var coinNameLabel: UILabel!
  
  @IBOutlet weak var button: UIButton!
  
  @IBOutlet var welcomeView: UIView!
  
  var coinsViewController: CoinsViewController?
  
  var imageViews: [UIImageView] = []
  
  var leftImageView: UIImageView {
    return self.imageViews[0]
  }
  
  var rightImageView: UIImageView {
    return self.imageViews[1]
  }
  
  public func setButtonHiddenState(_ isHidden: Bool) {
    self.button.isHidden = isHidden
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
  
    //setup lock image
    self.imageViews = UIImage(named: "lock")!
      .divideIntoTwoVertialParts()
      .map { UIImageView.init(image: $0) }
    
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
    
    self.button.isHidden = true
  }
  
  @IBAction func onButtonTouch(_ sender: UIButton) {
    if let delegate = self.delegate {
      delegate.coinCell(self, with: self.index, didTouchButton: sender)
    }
  }
  
  public func transition(to nextDoorState: DoorState, onCompletion:(() -> ())?) {
    if nextDoorState == .opened {
      UIView.animate(
        withDuration: 1.0,
        delay: 0.3,
        options: [],
        animations: {
          self.leftImageView.center.x -= self.coinImage.bounds.width / 2
          self.rightImageView.center.x += self.coinImage.bounds.width / 2
          self.leftImageView.alpha = 0.0
          self.rightImageView.alpha = 0.0
      },
        completion: { (state: Bool) -> (Void) in
          if let block = onCompletion {
            block()
          }
      })
    } else {
      UIView.animate(
        withDuration: 1.0,
        delay: 0.3,
        options: [],
        animations: {
          self.leftImageView.center.x += self.coinImage.bounds.width / 2
          self.rightImageView.center.x -= self.coinImage.bounds.width / 2
          self.leftImageView.alpha = 0.5
          self.rightImageView.alpha = 0.5
      },
        completion: { (state: Bool) -> (Void) in
          if let block = onCompletion {
            block()
          }
      })
    }
  }
}
