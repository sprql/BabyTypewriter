//
//  SoundController.swift
//  BabyTypewriter
//
//  Created by Alexander Obukhov on 12/10/16.
//  Copyright © 2016 sprql. All rights reserved.
//

import AVFoundation

class SoundController {

    var pool: Array<AVAudioPlayer> = []
    let size = 3

    func initialize() {
        for _ in 0...size-1 {
            prepareSound()
        }
    }

    func play() {
        for index in 0...size-1 {
            let player = pool[index]
            if (!player.isPlaying) {
                player.play()
                break
            }
        }
    }

    func prepareSound() {
        let url = Bundle.main.url(forResource: "typewriter-keystroke", withExtension: "m4a")!
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            pool.append(player)
        } catch {
            Swift.print("Error open audio")
        }
    }
}
