//
//  ViewController.swift
//  Xylophone
//
//  Created by Евгений Башун on 29.01.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    private var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    
    @IBAction func keyPressed(_ sender: UIButton) {
        sender.alpha = 0.5
        playSound(sender.currentTitle ?? "")
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                sender.alpha = 1.0
            }
    }
    
    func playSound(_ text: String) {
        guard let url = Bundle.main.url(forResource: text, withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}

