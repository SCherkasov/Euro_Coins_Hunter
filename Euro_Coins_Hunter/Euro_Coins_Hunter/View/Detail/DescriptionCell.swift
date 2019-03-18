//
//  DescriptionCell.swift
//  Euro_Coins_Hunter
//
//  Created by Stanislav Cherkasov on 3/18/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import UIKit

class DescriptionCell: UITableViewCell {

  @IBOutlet var descriptionAboutCoin: UITextView!
  
  override func awakeFromNib() {
        super.awakeFromNib()
    
    let fixedWidth = descriptionAboutCoin.frame.size.width
    let newSize = descriptionAboutCoin.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
    descriptionAboutCoin.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
    }
}
