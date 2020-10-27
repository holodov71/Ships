//
//  BattleView.swift
//  Ships
//
//  Created by Admin on 21.10.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class BattleView: UIView {

    @IBOutlet var viewContainer: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    init(_ battle: Battle, index: Int = 0, frame: CGRect = CGRect(x: 0, y: 0, width: 100, height: 100)) {
        super.init(frame: frame)
        
        Bundle.main.loadNibNamed("BattleContainer", owner: self, options: nil)
        addSubview(viewContainer)
        viewContainer.frame = self.bounds
        viewContainer.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        self.nameLabel.text = battle.name
        self.dateLabel.text = battle.date
        self.idLabel.text = String(index)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
