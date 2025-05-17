//
//  MusicNoteLesson.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 17/05/25.
//

import Foundation
import SwiftUI

extension MusicNote {
    static let AllMusicNotes: [MusicNote] = [
        MusicNote(
            noteName: "Do",
            scientificName: "C4",
            frequency: "261.63 Hz",
            color: .red,
            frequencyWave: 26.163
        ),
        MusicNote(
            noteName: "Re",
            scientificName: "D4",
            frequency: "293.66 Hz",
            color: .orange,
            frequencyWave: 29.366
        ),
        MusicNote(
            noteName: "Mi",
            scientificName: "E4",
            frequency: "329.63 Hz",
            color: .yellow,
            frequencyWave: 32.9
        ),
        MusicNote(
            noteName: "Fa",
            scientificName: "F4",
            frequency: "349.23 Hz",
            color: .green,
            frequencyWave: 34.923
        ),
        MusicNote(
            noteName: "Sol",
            scientificName: "G4",
            frequency: "392.00 Hz",
            color: .blue,
            frequencyWave: 39.200
        ),
        MusicNote(
            noteName: "La",
            scientificName: "A4",
            frequency: "440.00 Hz",
            color: .purple,
            frequencyWave: 44.000
        ),
        MusicNote(
            noteName: "Si",
            scientificName: "B4",
            frequency: "493.88 Hz",
            color: Color(red: 244/255, green: 180/255, blue: 190/255),
            frequencyWave: 49.388
        ),
        MusicNote(
            noteName: "Do",
            scientificName: "C5",
            frequency: "523.25 Hz",
            color: Color(red: 200/255, green: 0/255, blue: 0/255),
            frequencyWave: 52.325
        )
    ]
    
    static let NoteForPreview: MusicNote =
    MusicNote(
        noteName: "Do",
        scientificName: "C4",
        frequency: "261.63 Hz",
        color: .red,
        frequencyWave: 26.163
    )
}
