//
//  Classes.swift
//  Ships
//
//  Created by Admin on 16.10.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

enum Types: String {
    case bb = "bb"
    case bc = "bc"
}

struct ClassSpecification {
    
    var name: String
    var type: String
    var country: String
    var numGuns: Int
    var bore: Int
    var displacement: Int
    
}

struct ClassesSpecification {
    
    var listOfClasses: [ClassSpecification]
    
    init() {
        self.listOfClasses = DB().getFullInfoAboutClasses()
    }
    
}

