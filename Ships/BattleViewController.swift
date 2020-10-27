//
//  BattleViewController.swift
//  Ships
//
//  Created by Admin on 21.10.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import AVKit

class BattleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let nameOfBattleLabel = UILabel(frame: CGRect(x: 15, y: self.view.frame.height-50, width: self.view.frame.width / 2 - 20, height: 50))
        nameOfBattleLabel.text = "Battle"
        let avVC = AVPlayerViewController()
        avVC.view.frame = CGRect(x: 20, y: 20, width: 300, height: 300)
        print("it was done!")
        self.addChild(avVC)
        self.view.addSubview(nameOfBattleLabel)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
