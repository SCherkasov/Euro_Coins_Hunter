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
  var year: String
  var designer: String
  var mint: String
  var material: String
  var weight: String
  var diameter: String
  var thickness: String
  var about: String
  var country: Country
  var isLocked = true
  
  init(with coinDict: [String: Any], country: Country, isLocked: Bool) {
    self.country = country
    self.isLocked = isLocked
    if let name = coinDict["name"] as? String,
      let image = coinDict["image"] as? String,
      let year = coinDict["year"] as? String,
      let designer = coinDict["designer"] as? String,
      let mint = coinDict["mint"] as? String,
      let material = coinDict["material"] as? String,
      let weight = coinDict["weight"] as? String,
      let diameter = coinDict["diameter"] as? String,
      let thickness = coinDict["thickness"] as? String,
      let about = coinDict["about"] as? String
    {
      self.name = name
      self.image = image
      self.year = year
      self.designer = designer
      self.mint = mint
      self.material = material
      self.weight = weight
      self.diameter = diameter
      self.thickness = thickness
      self.about = about
    } else {
      self.name = ""
      self.image = ""
      self.year = ""
      self.designer = ""
      self.mint = ""
      self.material = ""
      self.weight = ""
      self.diameter = ""
      self.thickness = ""
      self.about = ""
    }
  }
  
  public mutating func setNextState() -> Bool {
    self.isLocked = self.isLocked ? false : true
    return self.isLocked
  }
}
