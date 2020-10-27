//
//  Outcomes.swift
//  Ships
//
//  Created by Admin on 23.10.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

struct Outcome {
    
    var shipName: String
    var battleName: String
    var result: String
    var music: Data
    
}

struct Outcomes {
    var listOfOutcomes: [Outcome]
    
    init() {
        self.listOfOutcomes = DB().gettingOutcomesList()
    }
    
}
