//
//  RythmGame.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 18/05/25.
//

import Foundation
import SwiftUI

struct RythmGame: Identifiable {
    let id = UUID()
    let level: Int
    let allBars: [NoteBarConfig]
    let disabledNotes: [String]
    let lastNoteValueOff: String
}

