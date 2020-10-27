//
//  Battles.swift
//  Ships
//
//  Created by Admin on 16.10.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

//import Foundation
import UIKit


struct Battle {
    var name: String
    var date: String
    var video: Data
    
//    init(name: String, date: String, video: Data) {
//        self.name = name
//        self.date = date
//        self.video = video
//    }
}

struct Battles {
    
    var listOfBattle: [Battle]
    
    init() {
        self.listOfBattle = DB().gettingFullInfoAboutBattles()
    }
}

