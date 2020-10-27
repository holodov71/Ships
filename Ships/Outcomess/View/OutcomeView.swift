//
//  OutcomeView.swift
//  Ships
//
//  Created by Admin on 23.10.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class OutcomeView: UIView {

    @IBOutlet var outcomeViewContainer: UIView!
    
    @IBOutlet weak var shipLabel: UILabel!
    @IBOutlet weak var battleLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    init(_ outcome: Outcome, frame: CGRect = CGRect(x: 0, y: 0, width: 150, height: 150)) {
        super.init(frame: frame)
        
        Bundle.main.loadNibNamed("OutcomeContainer", owner: self, options: nil)
        addSubview(outcomeViewContainer)
        outcomeViewContainer.frame = self.bounds
        outcomeViewContainer.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        self.shipLabel.text = "Ship is \(outcome.shipName)"
        self.battleLabel.text = "Battle is \(outcome.battleName)"
        self.resultLabel.text = "Result is \(outcome.result)"
        print("It's ok!")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
