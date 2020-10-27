//
//  OutcomeCollectionViewCell.swift
//  Ships
//
//  Created by Admin on 23.10.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class OutcomeCollectionViewCell: UICollectionViewCell {
    
    func setCell(_ outcome: Outcome) {
        let cell = OutcomeView(outcome)
        addSubview(cell)
    }
    
    
}
