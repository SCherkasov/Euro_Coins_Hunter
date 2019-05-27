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
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    self.coinImage.layer.cornerRadius = self.coinImage.bounds.size.height / 2
    self.coinImage.clipsToBounds = true
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.imageViews = UIImage(named: "lock")!
      .divideIntoTwoVertialParts()
      .map { UIImageView.init(image: $0) }
    
    let width = self.coinImage.frame.width
    imageViews[0].frame = CGRect.zero
    imageViews[1].frame = CGRect.zero
    
    imageViews[0].alpha = 0.5
    imageViews[1].alpha = 0.5
    self.coinImage.addSubview(imageViews[0])
    self.coinImage.addSubview(imageViews[1])
  
    
    NSLayoutConstraint.activate([
      self.leftImageView.leftAnchor.constraint(equalTo: self.coinImage.leftAnchor),
      self.leftImageView.topAnchor.constraint(equalTo: self.coinImage.topAnchor),
      self.leftImageView.bottomAnchor.constraint(equalTo: self.coinImage.bottomAnchor),
      self.leftImageView.widthAnchor.constraint(equalTo: self.coinImage.widthAnchor, multiplier: 0.5)
      ])
    
    self.leftImageView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      self.rightImageView.rightAnchor.constraint(equalTo: self.coinImage.rightAnchor),
      self.rightImageView.topAnchor.constraint(equalTo: self.coinImage.topAnchor),
      self.rightImageView.bottomAnchor.constraint(equalTo: self.coinImage.bottomAnchor),
      self.rightImageView.widthAnchor.constraint(equalTo: self.coinImage.widthAnchor, multiplier: 0.5)
      ])
    self.rightImageView.translatesAutoresizingMaskIntoConstraints = false
    
    
    
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
