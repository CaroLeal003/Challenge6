//
//  MusicNoteLesson.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 17/05/25.
//

import Foundation
import SwiftUI

struct MusicNote: Identifiable {
    let id = UUID()
    let noteName: String
    let scientificName: String
    let frequency: String
    let color: Color
    let frequencyWave: Double
    let command: String
    let listMotorValuesOn: String
    let listMotorValuesOff: String
}
