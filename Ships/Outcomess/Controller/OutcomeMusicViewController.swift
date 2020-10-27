//
//  OutcomeMusicViewController.swift
//  Ships
//
//  Created by Admin on 25.10.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import AVFoundation
import WebKit

class OutcomeMusicViewController: UIViewController {

    let pauseButton = UIButton()
    let playButton = UIButton()
    let musicSlider = UISlider()
    var player = AVAudioPlayer()

  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //initButtons()
        self.title = "Music"
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        player.stop()
        print("Player was stopped!")
    }
    
    init(_ outcome: Outcome) {
        super.init(nibName: nil, bundle: nil)
        
        let url = saveAudioToTemp(outcome.music)
        
        
//        let webPl = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - 20 , height: self.view.frame.height * 0.05))
//        webPl.center = self.view.center
//        webPl.backgroundColor = .clear
//        let request = NSURLRequest(url: url)
//        webPl.load(request as URLRequest)
//        self.view.addSubview(webPl)
//
        

        do {
            try player = AVAudioPlayer(contentsOf: url)
            print("It's good!")
        } catch  {
            print("Error")
        }

        player.play()
            
        
        
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

    
    fileprivate func initButtons() {
        musicSlider.frame = CGRect(x: 40, y: 200, width: self.view.frame.width * 0.8, height: 20)
        
        
        playButton.frame = CGRect(x: 40, y: 400, width: self.view.frame.width / 3, height: 50)
        playButton.setTitle("Play", for: .normal)
        playButton.setTitleColor(.black, for: .normal)
        playButton.layer.cornerRadius = 10
        playButton.backgroundColor = .systemYellow
        
        pauseButton.frame = CGRect(x: 100 + self.view.frame.width / 3, y: 400, width: self.view.frame.width / 3, height: 50)
        pauseButton.setTitle("Pause", for: .normal)
        pauseButton.setTitleColor(.black, for: .normal)
        pauseButton.layer.cornerRadius = 10
        pauseButton.backgroundColor = .systemYellow
        
        
        self.view.addSubview(playButton)
        self.view.addSubview(musicSlider)
        self.view.addSubview(pauseButton)
    }
    
}

extension OutcomeMusicViewController {
    
    private func saveAudioToTemp(_ data: Data) -> URL {
        let url = FM.temporaryDirectoryURL.appendingPathComponent("music.mp3")
        
        print("url for file save = ",url)
                
        do {
            try data.write(to: url)
            print("file music.mp3 successfully create and save in folder Temp")
        } catch {
            print("file music.mp3 NOT save in folder Temp")
        }
        
        return url
    }
    
}
