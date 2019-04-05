//
//  VersionTableViewCell.swift
//  Euro_Coins_Hunter
//
//  Created by Stanislav Cherkasov on 4/5/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import UIKit

class VersionTableViewCell: UITableViewCell {
  
  @IBOutlet var version: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    if let text = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
      version.text = text
      print(text)
    }
  }
}
