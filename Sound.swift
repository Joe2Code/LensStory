//
//  Sound.swift
//  ALensStory
//
//  Created by Joe's Computer on 7/30/17.
//  Copyright © 2017 Joseph Mennemeier. All rights reserved.
//

import Foundation
import AVFoundation

public var audioPlayer = AVAudioPlayer()

public func playSound(file: String, ext: String) -> Void {
    do {
        let url = URL.init(fileURLWithPath: Bundle.main.path(forResource: file, ofType: ext)!)
        audioPlayer = try AVAudioPlayer(contentsOf: url)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        audioPlayer.numberOfLoops = 3
    } catch let error {
        print(error.localizedDescription)
    }
}

public func stopSound() {
    audioPlayer.setVolume(0, fadeDuration: 2.0)
    // audioPlayer.stop( )
}
