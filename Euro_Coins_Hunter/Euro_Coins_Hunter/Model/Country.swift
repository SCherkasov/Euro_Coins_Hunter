//
//  Country.swift
//  Euro_Coins_Hunter
//
//  Created by Stanislav Cherkasov on 3/16/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import Foundation

struct Country {
  var name: String
  var flagImageName: String
}

extension Country: Equatable {
  static func == (lhs: Country, rhs: Country) -> Bool {
    return
      
      lhs.name == rhs.name &&
        lhs.flagImageName == rhs.flagImageName
  }
}
