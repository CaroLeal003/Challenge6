//
//  AllLevels.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 28/05/25.
//

import Foundation
import SwiftUI

extension Level {
    static let allLevels: [Level] = [
        Level(
            learn:
                MusicNote(
                    noteName: "do",
                    scientificName: "C4",
                    frequency: "261.63 Hz",
                    color: .colorBrown,
                    frequencyWave: 26.163,
                    command: "NOTE_do",
                    listMotorValuesOn: "01130",
                    listMotorValuesOff: "01000",
                    imagePressed: "DooPressed",
                    imageUnpressed: "DooUnpressed",
                    imageName: "DooImage"
                ),
            game:
                RythmGame(
                    level: 1,
                    allBars: [
                        NoteBarConfig(duration: 70, color: .colorBrown, name: "do", verticalOffset: -58),
                        NoteBarConfig(duration: 90, color: .colorBrown, name: "do", verticalOffset: -58),
                        NoteBarConfig(duration: 70, color: .colorBrown, name: "do", verticalOffset: -58),
                        NoteBarConfig(duration: 90, color: .colorBrown, name: "do", verticalOffset: -58)
                    ],
                    disabledNotes: ["NOTE_Re", "NOTE_Mi", "NOTE_Fa", "NOTE_Sol", "NOTE_La", "NOTE_Si", "NOTE_Do"],
                    lastNoteValueOff: "01000"
                )
        ),
        Level(learn:
                MusicNote(
                    noteName: "Re",
                    scientificName: "D4",
                    frequency: "293.66 Hz",
                    color: .colorOrange,
                    frequencyWave: 29.366,
                    command: "NOTE_Re",
                    listMotorValuesOn: "02146",
                    listMotorValuesOff: "02000",
                    imagePressed: "RePressed",
                    imageUnpressed: "ReUnpressed",
                    imageName: "ReImage"
                ), game:
                RythmGame(
                    level: 2,
                    allBars: [
                        NoteBarConfig(duration: 80, color: .colorOrange, name: "Re", verticalOffset: -47),
                        NoteBarConfig(duration: 90, color: .colorBrown, name: "do", verticalOffset: -58),
                        NoteBarConfig(duration:  50, color: .colorOrange, name: "Re", verticalOffset: -47),
                        NoteBarConfig(duration:  50, color: .colorOrange, name: "Re", verticalOffset: -47),
                        NoteBarConfig(duration: 70, color: .colorBrown, name: "do", verticalOffset: -58),

                    ],
                    disabledNotes: ["NOTE_Mi", "NOTE_Fa", "NOTE_Sol", "NOTE_La", "NOTE_Si", "NOTE_Do"],
                    lastNoteValueOff: "01000"
                )
             ),
        Level(learn:
                MusicNote(
                    noteName: "Mi",
                    scientificName: "E4",
                    frequency: "329.63 Hz",
                    color: .colorYellow,
                    frequencyWave: 32.9,
                    command: "NOTE_Mi",
                    listMotorValuesOn: "03164",
                    listMotorValuesOff: "03000",
                    imagePressed: "MiPressed",
                    imageUnpressed: "MiUnpressed",
                    imageName: "MiImage"
                ), game:
                RythmGame(
                    level: 3,
                    allBars: [
                        NoteBarConfig(duration: 70, color: .colorYellow, name: "Mi", verticalOffset: -35),
                        NoteBarConfig(duration: 70, color: .colorOrange, name: "Re", verticalOffset: -47),
                        NoteBarConfig(duration: 70, color: .colorBrown, name: "do", verticalOffset: -58),
                        NoteBarConfig(duration: 70, color: .colorOrange, name: "Re", verticalOffset: -47),
                        NoteBarConfig(duration: 90, color: .colorYellow, name: "Mi", verticalOffset: -35),
                        NoteBarConfig(duration: 90, color: .colorYellow, name: "Mi", verticalOffset: -35),
                        NoteBarConfig(duration: 90, color: .colorYellow, name: "Mi", verticalOffset: -35),

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
                    color: .colorGreen,
                    frequencyWave: 34.923,
                    command: "NOTE_Fa",
                    listMotorValuesOn: "04174",
                    listMotorValuesOff: "04000",
                    imagePressed: "FaPressed",
                    imageUnpressed: "FaUnpressed",
                    imageName: "FaImage"
                ), game:
                RythmGame(
                    level: 4,
                    allBars: [
                        NoteBarConfig(duration: 80, color: .colorGreen, name: "Fa", verticalOffset: -23),
                        NoteBarConfig(duration: 80, color: .colorBrown, name: "do", verticalOffset: -58),
                        NoteBarConfig(duration: 80, color: .colorGreen, name: "Fa", verticalOffset: -23),
                        NoteBarConfig(duration: 60, color: .colorBrown, name: "do", verticalOffset: -58),
                        NoteBarConfig(duration: 60, color: .colorOrange, name: "Re", verticalOffset: -47),
                        NoteBarConfig(duration: 60, color: .colorYellow, name: "Mi", verticalOffset: -35),
                        NoteBarConfig(duration: 80, color: .colorGreen, name: "Fa", verticalOffset: -23),
                        

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
                    color: .colorBlue,
                    frequencyWave: 39.200,
                    command: "NOTE_Sol",
                    listMotorValuesOn: "05196",
                    listMotorValuesOff: "05000",
                    imagePressed: "SolPressed",
                    imageUnpressed: "SolUnpressed",
                    imageName: "SolImage"
                ), game:
                RythmGame(
                    level: 5,
                    allBars: [
                        NoteBarConfig(duration: 70, color: .colorBlue, name: "Sol", verticalOffset: -10),
                        NoteBarConfig(duration: 70, color: .colorGreen, name: "Fa", verticalOffset: -23),
                        NoteBarConfig(duration: 70, color: .colorYellow, name: "Mi", verticalOffset: -35),
                        NoteBarConfig(duration: 100, color: .colorBlue, name: "Sol", verticalOffset: -10),
                        NoteBarConfig(duration: 100, color: .colorYellow, name: "Mi", verticalOffset: -35),
                        NoteBarConfig(duration: 100, color: .colorBlue, name: "Sol", verticalOffset: -10),

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
                    color: .colorPurple,
                    frequencyWave: 44.000,
                    command: "NOTE_La",
                    listMotorValuesOn: "06220",
                    listMotorValuesOff: "06000",
                    imagePressed: "LaPressed",
                    imageUnpressed: "LaUnpressed",
                    imageName: "LaImage"
                ), game:
                RythmGame(
                    level: 6,
                    allBars: [
                        NoteBarConfig(duration: 60, color: .colorPurple, name: "La", verticalOffset: 2),
                        NoteBarConfig(duration: 60, color: .colorBlue, name: "Sol", verticalOffset: -10),
                        NoteBarConfig(duration: 60, color: .colorGreen, name: "Fa", verticalOffset: -23),
                        NoteBarConfig(duration: 60, color: .colorOrange, name: "Re", verticalOffset: -47),
                        NoteBarConfig(duration: 80, color: .colorBlue, name: "Sol", verticalOffset: -10),
                        NoteBarConfig(duration: 100, color: .colorPurple, name: "La", verticalOffset: 2),
                        NoteBarConfig(duration: 100, color: .colorPurple, name: "La", verticalOffset: 2),

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
                    color: .colorPink,
                    frequencyWave: 49.388,
                    command: "NOTE_Si",
                    listMotorValuesOn: "07246",
                    listMotorValuesOff: "07000",
                    imagePressed: "SiPressed",
                    imageUnpressed: "SiUnpressed",
                    imageName: "SiImage"
                )
              , game:
                RythmGame(
                    level: 7,
                    allBars: [
                        NoteBarConfig(duration: 60, color: .colorPink, name: "Si", verticalOffset: 15),
                        NoteBarConfig(duration: 60, color: .colorBlue, name: "Sol", verticalOffset: -10),
                        NoteBarConfig(duration: 60, color: .colorYellow, name: "Mi", verticalOffset: -35),
                        NoteBarConfig(duration: 60, color: .colorYellow, name: "Mi", verticalOffset: -35),
                        NoteBarConfig(duration: 80, color: .colorPink, name: "Si", verticalOffset: 15),
                        NoteBarConfig(duration: 80, color: .colorBlue, name: "Sol", verticalOffset: -10),
                        NoteBarConfig(duration: 100, color: .colorPink, name: "Si", verticalOffset: 15),

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
                    color: .colorRed,
                    frequencyWave: 52.325,
                    command: "NOTE_Do",
                    listMotorValuesOn: "08255",
                    listMotorValuesOff: "08000",
                    imagePressed: "doPressed",
                    imageUnpressed: "doUnpressed",
                    imageName: "DoImage"
                ), game:
                RythmGame(
                    level: 8,
                    allBars: [
                        NoteBarConfig(duration: 90, color: .colorRed, name: "Do", verticalOffset: 27),
                        NoteBarConfig(duration: 90, color: .colorPink, name: "Si", verticalOffset: 15),
                        NoteBarConfig(duration: 90, color: .colorPurple, name: "La", verticalOffset: 2),
                        NoteBarConfig(duration: 90, color: .colorBlue, name: "Sol", verticalOffset: -10),
                        NoteBarConfig(duration: 90, color: .colorGreen, name: "Fa", verticalOffset: -23),
                        NoteBarConfig(duration: 90, color: .colorYellow, name: "Mi", verticalOffset: -35),
                        NoteBarConfig(duration: 90, color: .colorOrange, name: "Re", verticalOffset: -47),
                        NoteBarConfig(duration: 90, color: .colorBrown, name: "do", verticalOffset: -58),
                    ],
                    disabledNotes: [""],
                    lastNoteValueOff: "01000"
                )
             ),
    ]
}

