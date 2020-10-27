//
//  BattleCollectionViewCell.swift
//  Ships
//
//  Created by Admin on 22.10.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class BattleCollectionViewCell: UICollectionViewCell {
    
    func setCell(_ battle: Battle, index: Int) {
        
        let battle = BattleView(battle, index: index, frame: CGRect(x: 0, y: 0, width: 120, height: 120))
        
        self.addSubview(battle)
    }
    
    
}
