//
//  Ship.swift
//  Ships
//
//  Created by Admin on 14.10.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

//import Foundation
import UIKit

struct Ship {
   
    var name: String
    var shipClass: String
    var launched: Int
    var icon: UIImage?
    
    init(name: String = "", shipClass: String = "", launched: Int = 0) {
        self.name = name
        self.shipClass = shipClass
        self.launched = launched
    }
    
    init(name: String, shipClass: String, launched: Int, icon: UIImage) {
        self.name = name
        self.shipClass = shipClass
        self.launched = launched
        self.icon = icon
    }
    
}

struct Ships {

    
    var listOfShips: [Ship]

    init() {
        self.listOfShips = DB().gettingFullInfoAboutShip()
    }

}


