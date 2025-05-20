//
//  Level.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 18/05/25.
//

import Foundation
import SwiftUI

struct Level: Identifiable {
    let id = UUID()
    let learn: MusicNote
    let game: RythmGame
}


extension Level {
    static let allLevels: [Level] = [
        Level(
            learn:
                MusicNote(
                    noteName: "do",
                    scientificName: "C4",
                    frequency: "261.63 Hz",
                    color: .red,
                    frequencyWave: 26.163,
                    command: "NOTE_do",
                    listMotorValuesOn: "01100",
                    listMotorValuesOff: "01000"
                ),
            game:
                RythmGame(
                    level: 1,
                    allBars: [
                        NoteBarConfig(duration: 50, color: .red, name: "do"),
                        NoteBarConfig(duration: 70, color: .red, name: "do"),
                        NoteBarConfig(duration: 50, color: .red, name: "do"),
                        NoteBarConfig(duration: 70, color: .red, name: "do")
                    ],
                    disabledNotes: ["NOTE_Re", "NOTE_Mi", "NOTE_Fa", "NOTE_Sol", "NOTE_La", "NOTE_Si", "NOTE_Do"]
                    ,
                    lastNoteValueOff: "01000"
                )
        ),
        Level(learn:
                MusicNote(
                    noteName: "Re",
                    scientificName: "D4",
                    frequency: "293.66 Hz",
                    color: .orange,
                    frequencyWave: 29.366,
                    command: "NOTE_Re",
                    listMotorValuesOn: "02255",
                    listMotorValuesOff: "02000"
                ), game:
                RythmGame(
                    level: 2,
                    allBars: [
                        NoteBarConfig(duration: 80, color: .orange, name: "Re"),
                        NoteBarConfig(duration: 70, color: .red, name: "do"),
                        NoteBarConfig(duration: 30, color: .orange, name: "Re"),
                        NoteBarConfig(duration: 30, color: .orange, name: "Re"),
                        NoteBarConfig(duration: 50, color: .red, name: "do"),
                        
                    ],
                    disabledNotes: ["NOTE_Mi", "NOTE_Fa", "NOTE_Sol", "NOTE_La", "NOTE_Si", "NOTE_Do"]
                    ,
                    lastNoteValueOff: "01000"
                )
             ),
        Level(learn:
                MusicNote(
                    noteName: "Mi",
                    scientificName: "E4",
                    frequency: "329.63 Hz",
                    color: .yellow,
                    frequencyWave: 32.9,
                    command: "NOTE_Mi",
                    listMotorValuesOn: "03200",
                    listMotorValuesOff: "03000"
                ), game:
                RythmGame(
                    level: 3,
                    allBars: [
                        NoteBarConfig(duration: 50, color: .yellow, name: "Mi"),
                        NoteBarConfig(duration: 50, color: .orange, name: "Re"),
                        NoteBarConfig(duration: 50, color: .red, name: "do"),
                        NoteBarConfig(duration: 50, color: .orange, name: "Re"),
                        NoteBarConfig(duration: 70, color: .yellow, name: "Mi"),
                        NoteBarConfig(duration: 70, color: .yellow, name: "Mi"),
                        NoteBarConfig(duration: 70, color: .yellow, name: "Mi"),
                        
                    ],
                    disabledNotes: ["NOTE_Fa", "NOTE_Sol", "NOTE_La", "NOTE_Si", "NOTE_Do"],
                    lastNoteValueOff: "03000"
                )
             ),
        Level(learn:
                MusicNote(
                    noteName: "Fa",
                    scientificName: "F4",
                    frequency: "349.23 Hz",
                    color: .green,
                    frequencyWave: 34.923,
                    command: "NOTE_Fa",
                    listMotorValuesOn: "04200",
                    listMotorValuesOff: "04000"
                ), game:
                RythmGame(
                    level: 4,
                    allBars: [
                        NoteBarConfig(duration: 80, color: .green, name: "Fa"),
                        NoteBarConfig(duration: 80, color: .red, name: "do"),
                        NoteBarConfig(duration: 80, color: .green, name: "Fa"),
                        NoteBarConfig(duration: 40, color: .red, name: "do"),
                        NoteBarConfig(duration: 40, color: .orange, name: "Re"),
                        NoteBarConfig(duration: 40, color: .yellow, name: "Mi"),
                        NoteBarConfig(duration: 80, color: .green, name: "Fa"),
                        
                        
                    ],
                    disabledNotes: ["NOTE_Sol", "NOTE_La", "NOTE_Si", "NOTE_Do"],
                    lastNoteValueOff: "04000"
                )
             ),
        Level(learn:
                MusicNote(
                    noteName: "Sol",
                    scientificName: "G4",
                    frequency: "392.00 Hz",
                    color: .blue,
                    frequencyWave: 39.200,
                    command: "NOTE_Sol",
                    listMotorValuesOn: "05200",
                    listMotorValuesOff: "05000"
                ), game:
                RythmGame(
                    level: 5,
                    allBars: [
                        NoteBarConfig(duration: 50, color: .blue, name: "Sol"),
                        NoteBarConfig(duration: 50, color: .green, name: "Fa"),
                        NoteBarConfig(duration: 50, color: .yellow, name: "Mi"),
                        NoteBarConfig(duration: 100, color: .blue, name: "Sol"),
                        NoteBarConfig(duration: 100, color: .yellow, name: "Mi"),
                        NoteBarConfig(duration: 100, color: .blue, name: "Sol"),
                        
                    ],
                    disabledNotes: ["NOTE_La", "NOTE_Si", "NOTE_Do"],
                    lastNoteValueOff: "05000"
                )
             ),
        Level(learn:
                MusicNote(
                    noteName: "La",
                    scientificName: "A4",
                    frequency: "440.00 Hz",
                    color: .purple,
                    frequencyWave: 44.000,
                    command: "NOTE_La",
                    listMotorValuesOn: "06200",
                    listMotorValuesOff: "06000"
                ), game:
                RythmGame(
                    level: 6,
                    allBars: [
                        NoteBarConfig(duration: 40, color: .purple, name: "La"),
                        NoteBarConfig(duration: 40, color: .blue, name: "Sol"),
                        NoteBarConfig(duration: 40, color: .green, name: "Fa"),
                        NoteBarConfig(duration: 40, color: .orange, name: "Re"),
                        NoteBarConfig(duration: 80, color: .blue, name: "Sol"),
                        NoteBarConfig(duration: 100, color: .purple, name: "La"),
                        NoteBarConfig(duration: 100, color: .purple, name: "La"),
                        
                    ],
                    disabledNotes: ["NOTE_Si", "NOTE_Do"],
                    lastNoteValueOff: "06000"
                )
             ),
        Level(learn:
                MusicNote(
                    noteName: "Si",
                    scientificName: "B4",
                    frequency: "493.88 Hz",
                    color: Color(red: 244/255, green: 180/255, blue: 190/255),
                    frequencyWave: 49.388,
                    command: "NOTE_Si",
                    listMotorValuesOn: "07200",
                    listMotorValuesOff: "07000"
                )
              , game:
                RythmGame(
                    level: 7,
                    allBars: [
                        NoteBarConfig(duration: 40, color: Color(red: 244/255, green: 180/255, blue: 190/255), name: "Si"),
                        NoteBarConfig(duration: 40, color: .blue, name: "Sol"),
                        NoteBarConfig(duration: 40, color: .yellow, name: "Mi"),
                        NoteBarConfig(duration: 40, color: .yellow, name: "Mi"),
                        NoteBarConfig(duration: 80, color: Color(red: 244/255, green: 180/255, blue: 190/255), name: "Si"),
                        NoteBarConfig(duration: 80, color: .blue, name: "Sol"),
                        NoteBarConfig(duration: 100, color: Color(red: 244/255, green: 180/255, blue: 190/255), name: "Si"),
                        
                    ],
                    disabledNotes: ["NOTE_Do"],
                    lastNoteValueOff: "07000"
                )
             ),
        Level(learn:
                MusicNote(
                    noteName: "Do",
                    scientificName: "C5",
                    frequency: "523.25 Hz",
                    color: Color(red: 200/255, green: 0/255, blue: 0/255),
                    frequencyWave: 52.325,
                    command: "NOTE_Do",
                    listMotorValuesOn: "08200",
                    listMotorValuesOff: "08000"
                ), game:
                RythmGame(
                    level: 8,
                    allBars: [
                        NoteBarConfig(duration: 70, color: Color(red: 200/255, green: 0/255, blue: 0/255), name: "Do"),
                        NoteBarConfig(duration: 70, color: Color(red: 244/255, green: 180/255, blue: 190/255), name: "Si"),
                        NoteBarConfig(duration: 70, color: .purple, name: "La"),
                        NoteBarConfig(duration: 70, color: .blue, name: "Sol"),
                        NoteBarConfig(duration: 70, color: .green, name: "Fa"),
                        NoteBarConfig(duration: 70, color: .yellow, name: "Mi"),
                        NoteBarConfig(duration: 70, color: .orange, name: "Re"),
                        NoteBarConfig(duration: 70, color: .red, name: "do"),
                    ],
                    disabledNotes: [""],
                    lastNoteValueOff: "01000"
                )
             ),
    ]
}
