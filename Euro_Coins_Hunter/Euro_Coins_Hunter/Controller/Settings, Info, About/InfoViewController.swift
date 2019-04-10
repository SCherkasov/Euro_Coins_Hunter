//
//  InfoViewController.swift
//  Euro_Coins_Hunter
//
//  Created by Stanislav Cherkasov on 4/10/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
  
  let infoText = """
The euro is the official single currency of a number of European Union (EU) member states, which together constitute the euro area.
The emergence of the euro currency was the completion of the EU's longstanding efforts to bring their national financial systems closer together.
Eurocent
In 1992, the Maastricht Treaty (Treaty on European Union) was signed, providing for the transformation of the EU into an economic, monetary and political union.
The agreement provided for a timetable for the introduction of a single currency and general rules in the field of the state budget, inflation and interest rates for all members of the future monetary union.
In order for the euro to be put into circulation, all member countries of the monetary union must meet strict criteria of stability, enshrined in the Maastricht agreements.
In 1995, at the summit in Madrid, the name of the new currency, the euro, the transition scenario to the new single currency and the start date of the transition to the euro, January 1, 1999, were agreed. Also in 1995, the euro symbol "€" was chosen. The Greek letter "Upsilon" served as the basis for the graphic symbol of the euro, which can be traced to the first letter of the word "Europe". The parallel lines symbolize the stability of the euro.
In June 1998, the European Central Bank (ECB) was established, replacing the European Monetary Institute.
The real progress achieved by all EU member states in implementing the “convergence criteria” allowed the European Council at a meeting held in Brussels (Belgium) on May 1-2, 1998, to decide on the creation of an Economic and Monetary Union (EMU) consisting of 11 countries - Austria, Belgium, Germany, Ireland, Spain, Italy, Luxembourg, the Netherlands, Portugal, Finland and France.
Two countries - the United Kingdom and Denmark - also met most of these criteria, but refused to enter the "euro zone" as its first participants. Sweden and Greece had financial indicators that did not meet the necessary requirements. Greece joined the euro zone on January 1, 2001.
On January 1, 1999, at 00:00 European time, the countries of the European Economic and Monetary Union introduced a single currency, the euro, and began to use it for cashless payments. At this stage, both the euro and national currencies functioned in a parallel and equitable manner.
From January 1, 2002, euro banknotes and coins were introduced in circulation, replacing the old banknotes and coins in national currency units. The period of parallel circulation lasted until the end of February.
Since March 1, 2002, a cash and non-cash euro has completely replaced the national currencies of twelve EU countries.
After 2002, several more countries entered the eurozone - Slovenia (2007), Cyprus (2008), Malta (2008), Slovakia (2009), Estonia (2011), Latvia (2014) and Lithuania (2015). Currently, the euro area includes 19 countries.
Andorra, Monaco, San Marino and the Vatican have adopted the euro as their national currency due to specific monetary agreements with the EU, and can issue their own euro coins within certain limits. However, since they are not members of the EU, they are not part of the euro area.
Cash Euros, introduced in 2002, are issued in the form of coins and banknotes. Their design was chosen on the basis of competitions held by the European Monetary Institute in 1996.
Euro consists of 100 cents (euro cent). Eight euro coins are issued - 1, 2, 5, 10, 20 and 50 cents, as well as 1 and 2 euros. They vary in size, weight, color and thickness depending on the denomination. The coins of the highest denomination - 1 and 2 euros - two-color (silver and yellow). The coins of average nominal value - 10, 20 and 50 euro cents - are yellow, and the coins of small denomination - 1, 2 and 5 euro cents are copper colors.
Unlike banknotes, which are the same for all countries in the eurozone, coins have one common side, on which the dignity of the coin is marked, and the other - “national”. It contains the image selected by the country in which the coin is minted. The design competition for the overall side of the euro coins was won by Luc Luiks, employee of the Belgian Royal Mint. His project consisted of three different maps of Europe, with a background of twelve stars of the European Union.
The design of the common side of 1, 2 and 5 cent coins symbolizes the place of Europe around the world. On 10, 20 and 50 cent coins it is shown how the states of the Eurozone get together (the states which are not members of the European Union are also shown).
On coins of 1 and 2 euros, Europe is depicted without borders. The drawing of all the coins contains twelve stars.
In 2005, the European Council decided that the common side of all coin values ​​should be updated to reflect EU enlargement. Since 2007, the updated coins began to issue new members of the euro area.
"""

    override func viewDidLoad() {
        super.viewDidLoad()

      self.navigationController?.navigationBar.topItem?.title = ""
    }

}

extension InfoViewController: UITableViewDelegate {
  
}

extension InfoViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InfoTableViewCell
    
    cell.infoLabel.text = infoText
    
    return cell
  }
  
  
}
