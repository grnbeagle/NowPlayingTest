//
//  ViewController.swift
//  NowPlayingTest
//
//  Created by Amie Kweon on 3/28/16.
//  Copyright © 2016 Amie Kweon. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

class ViewController: UIViewController {

    var toggle = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Try using AVAudioSession
//        do {
//            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
//            try AVAudioSession.sharedInstance().setActive(true)
//        } catch {
//            NSLog("ERROR with audio session")
//        }

        // Try using AVPlayer
        let player = AVPlayer(URL: NSURL(string: "http://www.ebookfrenzy.com/ios_book/movie/movie.mov")!)
        let playerController = AVPlayerViewController()
        playerController.player = player
        self.addChildViewController(playerController)
        self.view.addSubview(playerController.view)
        playerController.view.frame = self.view.frame

        player.play()

        UIApplication.sharedApplication().beginReceivingRemoteControlEvents()
        updateNowPlaying()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onButtonClick(sender: AnyObject) {
        updateNowPlaying()
    }

    func updateNowPlaying() {
        let playbackRate: Double = toggle ? 0.0 : 1.0
        NSLog(">>> playbackRate: \(playbackRate)")
        let info: [String: AnyObject] = [
            MPMediaItemPropertyTitle: "My Title",
            MPMediaItemPropertyArtist: "My Artist",
            MPMediaItemPropertyAlbumTitle: "My Title",
            MPNowPlayingInfoPropertyElapsedPlaybackTime: 100.0,
            MPNowPlayingInfoPropertyPlaybackRate: playbackRate
        ]
        MPNowPlayingInfoCenter.defaultCenter().nowPlayingInfo = info
        toggle = !toggle
    }
}

