//
//  BattleVideoViewController.swift
//  Ships
//
//  Created by Admin on 22.10.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import AVKit
import WebKit


struct FM {
    public static var temporaryDirectoryURL: URL {
            return FileManager.default.temporaryDirectory
        }
}

class BattleVideoViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    fileprivate func initNameLabel(_ battle: Battle) {
        let nameLabel = UILabel(frame: CGRect(x: 10, y: (self.view.frame.height * 0.7 ) + 110, width: self.view.frame.width - 20, height: self.view.frame.height * 0.07))
        nameLabel.text = "Name of battle is \(battle.name)"
        nameLabel.backgroundColor = .systemYellow
        nameLabel.layer.borderWidth = 0.5
        nameLabel.layer.cornerRadius = 20
        self.view.addSubview(nameLabel)
    }
    
    fileprivate func initDateLabel(_ y: CGFloat, _ battle: Battle) {
        let dateLabel = UILabel(frame: CGRect(x: 10, y: y, width: self.view.frame.width - 20, height: self.view.frame.height * 0.07))
        
        dateLabel.backgroundColor = .systemYellow
        dateLabel.layer.borderWidth = 0.5
        dateLabel.layer.cornerRadius = 20
        dateLabel.text = "Date of battle is \(battle.date)"
        
        //        let dateLabel = UILabel(frame: CGRect(x: 10, y: (self.view.frame.height * 0.7) + 110 + (self.view.frame.height * 0.1) + 10, width: self.view.frame.width - 20, height: self.view.frame.height * 0.1))
        
        self.view.addSubview(dateLabel)
    }
    
    init(_ battle: Battle) {
        super.init(nibName: nil, bundle: nil)
        
        initNameLabel(battle)
        
        let y = (self.view.frame.height * 0.7) + 110 + (self.view.frame.height * 0.1)
        
        initDateLabel(y, battle)
        
        let url = saveVideoToTemp(battle.video)
        
        
        let webPl = WKWebView(frame: CGRect(x: 10, y: 100, width: self.view.frame.width - 20 , height: self.view.frame.height * 0.7))
        webPl.backgroundColor = .systemGray
        let request = NSURLRequest(url: url)
        webPl.load(request as URLRequest)
        self.view.addSubview(webPl)
        
//        let player = AVPlayer(url: url)
//        let avVC = AVPlayerViewController()
//        avVC.player = player
//
//        avVC.view.frame = CGRect(x: 10, y: 100, width: self.view.frame.width - 20 , height: self.view.frame.height * 0.7)
//        self.view.addSubview(avVC.view)
//        self.addChild(avVC)
//        player.play()
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

extension BattleVideoViewController {
    
    
    private func saveVideoToTemp(_ data: Data) -> URL {
        let url = FM.temporaryDirectoryURL.appendingPathComponent("video.mp4")
        
        print("url for file save = ",url)
                
        do {
            try data.write(to: url)
            print("file video.mp4 successfully create and save in folder Temp")
        } catch {
            print("file video.mp4 NOT save in folder Temp")
        }
        
        return url
    }
    
}
