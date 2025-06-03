//
//  SoundManager.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 03/06/25.
//

import Foundation
import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    var player: AVAudioPlayer?

    func playSound(named fileName: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
            print("No se encontró el archivo: \(fileName).mp3")
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error al reproducir \(fileName): \(error.localizedDescription)")
        }
    }
}
