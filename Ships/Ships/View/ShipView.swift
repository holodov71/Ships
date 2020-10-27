//
//  ShipView.swift
//  Ships
//
//  Created by Admin on 14.10.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class ShipView: UIView {

    
    @IBOutlet var shipContainer: UIView!
    
    @IBOutlet weak var shipImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var launchedLabel: UILabel!
    
    init(_ ship: Ship, frame: CGRect = CGRect(x: 0, y: 0, width: 120, height: 120)) {
        super.init(frame: frame)
        
        Bundle.main.loadNibNamed("ShipContainer", owner: self, options: nil)
        addSubview(shipContainer)
        shipContainer.frame = self.bounds
        shipContainer.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        self.nameLabel.text = ship.name
        self.classLabel.text = ship.shipClass
        self.launchedLabel.text = String(ship.launched)
        if let icon = ship.icon {
            self.shipImage.image = icon
        }
        self.backgroundColor = .systemYellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //private var ship = Ship()
    
//    private var shipImage = UIImageView()
//    private var name = UILabel()
//    private var shipClass = UILabel()
//    private var launched = UILabel()
    
//    init(_ ship: Ship, _ frameImage: CGRect, _ nameLabelFrame: CGRect, _ shipClassLabelFrame: CGRect, _ launchedLabelFrame: CGRect) {
//        
//        let shipImage = UIImageView()
//        let name = UILabel()
//        let shipClass = UILabel()
//        let launched = UILabel()
//        
//        let frame = CGRect(x: 0, y: 0, width: 0, height: 0)
//        
//        super.init(frame: frame)
//        //self.ship = ship
//        shipImage.frame = frameImage
//        name.frame = nameLabelFrame
//        shipClass.frame = shipClassLabelFrame
//        launched.frame = launchedLabelFrame
//        
//        if let icon = ship.icon {
//            shipImage.image = icon
//        }
//        
//        
//        name.text = ship.name
//        shipClass.text = ship.shipClass
//        launched.text = String(ship.launched)
//        
//        //self.backgroundColor = .yellow
//        self.addSubview(shipImage)
//        self.addSubview(name)
//        self.addSubview(shipClass)
//        self.addSubview(launched)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    

}
