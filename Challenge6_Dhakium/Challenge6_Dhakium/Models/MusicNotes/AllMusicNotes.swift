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
            noteName: "do",
            scientificName: "C4",
            frequency: "261.63 Hz",
            color: .red,
            frequencyWave: 26.163,
            command: "NOTE_do",
            listMotorValuesOn: "01130",
            listMotorValuesOff: "01000"
        ),
        MusicNote(
            noteName: "Re",
            scientificName: "D4",
            frequency: "293.66 Hz",
            color: .orange,
            frequencyWave: 29.366,
            command: "NOTE_Re",
            listMotorValuesOn: "02146",
            listMotorValuesOff: "02000"
        ),
        MusicNote(
            noteName: "Mi",
            scientificName: "E4",
            frequency: "329.63 Hz",
            color: .yellow,
            frequencyWave: 32.9,
            command: "NOTE_Mi",
            listMotorValuesOn: "03164",
            listMotorValuesOff: "03000"
        ),
        MusicNote(
            noteName: "Fa",
            scientificName: "F4",
            frequency: "349.23 Hz",
            color: .green,
            frequencyWave: 34.923,
            command: "NOTE_Fa",
            listMotorValuesOn: "04174",
            listMotorValuesOff: "04000"
        ),
        MusicNote(
            noteName: "Sol",
            scientificName: "G4",
            frequency: "392.00 Hz",
            color: .blue,
            frequencyWave: 39.200,
            command: "NOTE_Sol",
            listMotorValuesOn: "05196",
            listMotorValuesOff: "05000"
        ),
        MusicNote(
            noteName: "La",
            scientificName: "A4",
            frequency: "440.00 Hz",
            color: .purple,
            frequencyWave: 44.000,
            command: "NOTE_La",
            listMotorValuesOn: "06220",
            listMotorValuesOff: "06000"
        ),
        MusicNote(
            noteName: "Si",
            scientificName: "B4",
            frequency: "493.88 Hz",
            color: Color(red: 244/255, green: 180/255, blue: 190/255),
            frequencyWave: 49.388,
            command: "NOTE_Si",
            listMotorValuesOn: "07246",
            listMotorValuesOff: "07000"
        ),
        MusicNote(
            noteName: "Do",
            scientificName: "C5",
            frequency: "523.25 Hz",
            color: Color(red: 200/255, green: 0/255, blue: 0/255),
            frequencyWave: 52.325,
            command: "NOTE_Do",
            listMotorValuesOn: "08255",
            listMotorValuesOff: "08000"
        )
    ]
    
    static let NoteForPreview: MusicNote =
    MusicNote(
        noteName: "Do",
        scientificName: "C4",
        frequency: "261.63 Hz",
        color: .red,
        frequencyWave: 26.163,
        command: "NOTE_Do",
        listMotorValuesOn: "01100",
        listMotorValuesOff: "01000"
    )
}
