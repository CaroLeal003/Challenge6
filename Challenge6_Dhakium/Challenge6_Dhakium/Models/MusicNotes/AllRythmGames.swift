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
