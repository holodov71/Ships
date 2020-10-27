//
//  CollectionViewCell.swift
//  Ships
//
//  Created by Admin on 16.10.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    
    var shipImage = UIImageView()
    var name = UILabel()
    var shipClass = UILabel()
    var launched = UILabel()
    
    func setCellXib(_ ship: Ship) {
        let ship = ShipView(ship)
        
        self.addSubview(ship)
    }
    
    func setCell(_ ship: Ship) {
        
        
        self.shipImage.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height * 0.5)
        self.name.frame = CGRect(x: 0, y: self.frame.height * 0.6, width: self.frame.width, height: self.frame.height * 0.13)
//        self.name.font = .systemFont(ofSize: 9)
        self.name.adjustsFontSizeToFitWidth = true
        
        self.shipClass.frame = CGRect(x: 0, y: self.frame.height * 0.74, width: self.frame.width, height: self.frame.height * 0.13)
//        self.shipClass.font = .systemFont(ofSize: 9)
        self.shipClass.adjustsFontSizeToFitWidth = true
        
        self.launched.frame = CGRect(x: 0, y: self.frame.height * 0.87, width: self.frame.width, height: self.frame.height * 0.13)
        self.launched.adjustsFontSizeToFitWidth = true
//        self.launched.font = .systemFont(ofSize: 9)
        
        if let icon = ship.icon {
            self.shipImage.image = icon
        }
        
        self.name.text = "Name is \(ship.name)"
        self.shipClass.text = "Class is \(ship.shipClass)"
        self.launched.text = "Launched is \(String(ship.launched))"
        
        
        self.addSubview(self.shipImage)
        self.addSubview(self.name)
        self.addSubview(self.shipClass)
        self.addSubview(self.launched)
    }
////    init(_ ship: Ship) {
////
////        let frame = CGRect(x: 0, y: 0, width: 200, height: 200)
////
////        super.init(frame: frame)
////        self.ship = ship
////        self.shipImage.frame = CGRect(x: 0, y: 0, width: 200, height: 130)
////
////        if let icon = self.ship.icon {
////            self.shipImage.image = icon
////        }
////
////        //        self.center = ViewController.view.center
////        self.name.text = self.ship.name
////        self.shipClass.text = self.ship.shipClass
////        self.launched.text = String(self.ship.launched)
////
////        self.backgroundColor = .yellow
////        self.addSubview(self.shipImage)
////        self.addSubview(self.name)
////        self.addSubview(self.shipClass)
////        self.addSubview(self.launched)
////    }
////
////    required init?(coder: NSCoder) {
////        fatalError("init(coder:) has not been implemented")
////    }
}
