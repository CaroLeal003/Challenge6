//
//  AllRythmGames.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 18/05/25.
//

import Foundation
import SwiftUI

extension RythmGame {
    static let AllRythmGames: [RythmGame] = [
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
        ),
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
        ),
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
        ),
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
        ),
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
        ),
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
        ),
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
        ),
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
    ]
    
    static let RythmGameForPreview: RythmGame =
        RythmGame(
            level: 10,
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
    
}
