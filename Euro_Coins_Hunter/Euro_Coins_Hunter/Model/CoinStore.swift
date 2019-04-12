//
//  CoinStore.swift
//  Euro_Coins_Hunter
//
//  Created by Stanislav Cherkasov on 3/16/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import Foundation

class CoinStore {
  
  var coins = [Coin]()
  private var internalCoins = [Coin]()
  var countries = [Country]()
  
  func loadCoins() {
    var countries = [Country]()
    var coins = [Coin]()
    
    if let path = Bundle.main.path(forResource: "BaseOfCoinCountry",
                                   ofType: "json") {
      
      let data = try! Data(contentsOf: URL(fileURLWithPath: path),
                           options: .mappedIfSafe)
      let jsonResult = try! JSONSerialization.jsonObject(with: data,
                                                         options: .mutableLeaves)
      if let jsonResult = jsonResult as? Dictionary<String, AnyObject>,
        let countriesDict = jsonResult["Countries"] as? [[String: Any]] {
        
        for countryDict in countriesDict {
          if let countryName = countryDict["name"] as? String,
            let countryFlagImageName = countryDict["flagImageName"] as? String,
            let countryCoinsD = countryDict["Coins"] as? [[String: String]]
          {
            let country = Country.init(name: countryName, flagImageName:
              countryFlagImageName)
            countries.append(country)
            
            var countryCoins = [Coin]()
            
            for coinDict in countryCoinsD {
              if let name = coinDict["name"],
                let image = coinDict["image"],
                let year = coinDict["year"],
                let designer = coinDict["designer"],
                let mint = coinDict["mint"],
                let material = coinDict["material"],
                let weight = coinDict["weight"],
                let diameter = coinDict["diameter"],
                let thickness = coinDict["thickness"],
                let about = coinDict["about"]
              {
                countryCoins.append(Coin.init(name: name,
                                              image: image,
                                              year: year,
                                              designer: designer,
                                              mint: mint,
                                              material: material,
                                              weight: weight,
                                              diameter: diameter,
                                              thickness: thickness,
                                              about: about,
                                              country: country,
                                              isLocked: true))
              }
            }
            
            coins = coins + countryCoins
          }
        }
      }
      
      self.internalCoins = coins
      self.coins = coins
      self.countries = countries
      
    }
  }
  
  func filterCoins(with country: Country) {
    self.coins = []
    for coin in self.internalCoins {
      if coin.country == country {
        self.coins.append(coin)
      }
    }
  }
}
