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
                NoteBarConfig(duration: 90, color: .colorRed, name: "Do", verticalOffset: UIDevice.isPad ? 88 : 73),
                NoteBarConfig(duration: 90, color: .colorPink, name: "Si", verticalOffset: 61),
                NoteBarConfig(duration: 90, color: .colorPurple, name: "La", verticalOffset: UIDevice.isPad ? 33 : 48),
                NoteBarConfig(duration: 90, color: .colorBlue, name: "Sol", verticalOffset: UIDevice.isPad ? 8 : 36),
                NoteBarConfig(duration: 90, color: .colorGreen, name: "Fa", verticalOffset: UIDevice.isPad ? -23 : 23),
                NoteBarConfig(duration: 90, color: .colorYellow, name: "Mi", verticalOffset: UIDevice.isPad ? -50 : 10),
                NoteBarConfig(duration: 90, color: .colorOrange, name: "Re", verticalOffset: UIDevice.isPad ? -73 : -1),
                NoteBarConfig(duration: 90, color: .colorDarkRed, name: "do", verticalOffset: UIDevice.isPad ? -93 : -11),
            ],
            disabledNotes: [""],
            lastNoteValueOff: "01000"
        )
    
}
