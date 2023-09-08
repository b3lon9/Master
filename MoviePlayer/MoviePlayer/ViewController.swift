//
//  ViewController.swift
//  MoviePlayer
//
//  Created by cave dwellers on 2023/09/09.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnPlayInternalMovie(_ sender: UIButton) {
        let filePath:String? = Bundle.main.path(forResource: "FastTyping", ofType: "mp4")
        let url = NSURL(fileURLWithPath: filePath!)
        
        /*
        let playerController = AVPlayerViewController()
        
        let player = AVPlayer(url: url as URL)
        playerController.player = player
        
        self.present(playerController, animated: true) {
            player.play()
        }
        */
        playVideo(url: url)
    }
    
    // 외부 링크에서 비디오 재생
    @IBAction func btnPlayExternalMovie(_ sender: UIButton) {
        let urlStr = "https://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fireworks.mp4"
        let url = NSURL(string: urlStr)!
        
        /*
        let playerController = AVPlayerViewController()
        
        let player = AVPlayer(url: url as URL)
        playerController.player = player
        
        self.present(playerController, animated: true) {
            player.play()
        }
        */
        
        playVideo(url: url)
    }
    
    // 비디오 재생 함수
    private func playVideo(url: NSURL) {
        let playerController = AVPlayerViewController()
        
        let player = AVPlayer(url: url as URL)
        playerController.player = player
        
        self.present(playerController, animated: true) {
            player.play()
        }
    }
}

