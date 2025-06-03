//
//  AllRythmGames.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 18/05/25.
//

import Foundation
import SwiftUI

extension RythmGame {
    static let RythmGameForPreview: RythmGame =
        RythmGame(
            level: 10,
            allBars: [ //27 a 73
                NoteBarConfig(duration: 90, color: .colorRed, name: "Do", verticalOffset: 73),
                NoteBarConfig(duration: 90, color: .colorPink, name: "Si", verticalOffset: 61),
                NoteBarConfig(duration: 90, color: .colorPurple, name: "La", verticalOffset: 48),
                NoteBarConfig(duration: 90, color: .colorBlue, name: "Sol", verticalOffset: 36),
                NoteBarConfig(duration: 90, color: .colorGreen, name: "Fa", verticalOffset: 23),
                NoteBarConfig(duration: 90, color: .colorYellow, name: "Mi", verticalOffset: 10),
                NoteBarConfig(duration: 90, color: .colorOrange, name: "Re", verticalOffset: -1),
                NoteBarConfig(duration: 90, color: .colorDarkRed, name: "do", verticalOffset: -11),
            ],
            disabledNotes: [""],
            lastNoteValueOff: "01000"
        )
    
}
