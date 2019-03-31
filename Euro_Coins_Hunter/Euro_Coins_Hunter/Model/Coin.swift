//
//  Coin.swift
//  Euro_Coins_Hunter
//
//  Created by Stanislav Cherkasov on 3/16/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import Foundation

struct Coin {
  var name: String
  var image: String
  var country: Country
  var isLocked = true;
  
  public mutating func setNextState() -> Bool {
    self.isLocked = self.isLocked ? false : true
    return self.isLocked
  }
}
