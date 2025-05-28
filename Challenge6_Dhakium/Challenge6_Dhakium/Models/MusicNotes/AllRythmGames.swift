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
                NoteBarConfig(duration: 70, color: .red, name: "do", verticalOffset: -73),
                NoteBarConfig(duration: 90, color: .red, name: "do", verticalOffset: -73),
                NoteBarConfig(duration: 70, color: .red, name: "do", verticalOffset: -73),
                NoteBarConfig(duration: 90, color: .red, name: "do", verticalOffset: -73)
            ],
            disabledNotes: ["NOTE_Re", "NOTE_Mi", "NOTE_Fa", "NOTE_Sol", "NOTE_La", "NOTE_Si", "NOTE_Do"],
            lastNoteValueOff: "01000"
        ),
        RythmGame(
            level: 2,
            allBars: [
                NoteBarConfig(duration: 80, color: .orange, name: "Re", verticalOffset: 10),
                NoteBarConfig(duration: 90, color: .red, name: "do", verticalOffset: 0),
                NoteBarConfig(duration:  50, color: .orange, name: "Re", verticalOffset: 10),
                NoteBarConfig(duration:  50, color: .orange, name: "Re", verticalOffset: 10),
                NoteBarConfig(duration: 70, color: .red, name: "do", verticalOffset: 0),

            ],
            disabledNotes: ["NOTE_Mi", "NOTE_Fa", "NOTE_Sol", "NOTE_La", "NOTE_Si", "NOTE_Do"],
            lastNoteValueOff: "01000"
        ),
        RythmGame(
            level: 3,
            allBars: [
                NoteBarConfig(duration: 70, color: .yellow, name: "Mi", verticalOffset: 20),
                NoteBarConfig(duration: 70, color: .orange, name: "Re", verticalOffset: 10),
                NoteBarConfig(duration: 70, color: .red, name: "do", verticalOffset: 0),
                NoteBarConfig(duration: 70, color: .orange, name: "Re", verticalOffset: 10),
                NoteBarConfig(duration: 90, color: .yellow, name: "Mi", verticalOffset: 20),
                NoteBarConfig(duration: 90, color: .yellow, name: "Mi", verticalOffset: 20),
                NoteBarConfig(duration: 90, color: .yellow, name: "Mi", verticalOffset: 20),

            ],
            disabledNotes: ["NOTE_Fa", "NOTE_Sol", "NOTE_La", "NOTE_Si", "NOTE_Do"],
            lastNoteValueOff: "03000"
        ),
        RythmGame(
            level: 4,
            allBars: [
                NoteBarConfig(duration: 80, color: .green, name: "Fa", verticalOffset: 30),
                NoteBarConfig(duration: 80, color: .red, name: "do", verticalOffset: 0),
                NoteBarConfig(duration: 80, color: .green, name: "Fa", verticalOffset: 30),
                NoteBarConfig(duration: 60, color: .red, name: "do", verticalOffset: 0),
                NoteBarConfig(duration: 60, color: .orange, name: "Re", verticalOffset: 10),
                NoteBarConfig(duration: 60, color: .yellow, name: "Mi", verticalOffset: 20),
                NoteBarConfig(duration: 80, color: .green, name: "Fa", verticalOffset: 30),
                

            ],
            disabledNotes: ["NOTE_Sol", "NOTE_La", "NOTE_Si", "NOTE_Do"],
            lastNoteValueOff: "04000"
        ),
        RythmGame(
            level: 5,
            allBars: [
                NoteBarConfig(duration: 70, color: .blue, name: "Sol", verticalOffset: 40),
                NoteBarConfig(duration: 70, color: .green, name: "Fa", verticalOffset: 30),
                NoteBarConfig(duration: 70, color: .yellow, name: "Mi", verticalOffset: 20),
                NoteBarConfig(duration: 100, color: .blue, name: "Sol", verticalOffset: 40),
                NoteBarConfig(duration: 100, color: .yellow, name: "Mi", verticalOffset: 20),
                NoteBarConfig(duration: 100, color: .blue, name: "Sol", verticalOffset: 40),

            ],
            disabledNotes: ["NOTE_La", "NOTE_Si", "NOTE_Do"],
            lastNoteValueOff: "05000"
        ),
        RythmGame(
            level: 6,
            allBars: [
                NoteBarConfig(duration: 60, color: .purple, name: "La", verticalOffset: 50),
                NoteBarConfig(duration: 60, color: .blue, name: "Sol", verticalOffset: 40),
                NoteBarConfig(duration: 60, color: .green, name: "Fa", verticalOffset: 30),
                NoteBarConfig(duration: 60, color: .orange, name: "Re", verticalOffset: 10),
                NoteBarConfig(duration: 80, color: .blue, name: "Sol", verticalOffset: 40),
                NoteBarConfig(duration: 100, color: .purple, name: "La", verticalOffset: 50),
                NoteBarConfig(duration: 100, color: .purple, name: "La", verticalOffset: 50),

            ],
            disabledNotes: ["NOTE_Si", "NOTE_Do"],
            lastNoteValueOff: "06000"
        ),
        RythmGame(
            level: 7,
            allBars: [
                NoteBarConfig(duration: 60, color: Color(red: 244/255, green: 180/255, blue: 190/255), name: "Si", verticalOffset: 60),
                NoteBarConfig(duration: 60, color: .blue, name: "Sol", verticalOffset: 40),
                NoteBarConfig(duration: 60, color: .yellow, name: "Mi", verticalOffset: 20),
                NoteBarConfig(duration: 60, color: .yellow, name: "Mi", verticalOffset: 20),
                NoteBarConfig(duration: 80, color: Color(red: 244/255, green: 180/255, blue: 190/255), name: "Si", verticalOffset: 60),
                NoteBarConfig(duration: 80, color: .blue, name: "Sol", verticalOffset: 40),
                NoteBarConfig(duration: 100, color: Color(red: 244/255, green: 180/255, blue: 190/255), name: "Si", verticalOffset: 60),

            ],
            disabledNotes: ["NOTE_Do"],
            lastNoteValueOff: "07000"
        ),
        RythmGame(
            level: 8,
            allBars: [
                NoteBarConfig(duration: 90, color: Color(red: 200/255, green: 0/255, blue: 0/255), name: "Do", verticalOffset: 12),
                NoteBarConfig(duration: 90, color: Color(red: 244/255, green: 180/255, blue: 190/255), name: "Si", verticalOffset: 0),
                NoteBarConfig(duration: 90, color: .purple, name: "La", verticalOffset: -13),
                NoteBarConfig(duration: 90, color: .blue, name: "Sol", verticalOffset: -25),
                NoteBarConfig(duration: 90, color: .green, name: "Fa", verticalOffset: -38),
                NoteBarConfig(duration: 90, color: .yellow, name: "Mi", verticalOffset: -49),
                NoteBarConfig(duration: 90, color: .orange, name: "Re", verticalOffset: -61),
                NoteBarConfig(duration: 90, color: .red, name: "do", verticalOffset: -73),
            ],
            disabledNotes: [""],
            lastNoteValueOff: "01000"
        )
    ]
    
    static let RythmGameForPreview: RythmGame =
        RythmGame(
            level: 8,
            allBars: [
                NoteBarConfig(duration: 90, color: Color(red: 200/255, green: 0/255, blue: 0/255), name: "Do", verticalOffset: 12),
                NoteBarConfig(duration: 90, color: Color(red: 244/255, green: 180/255, blue: 190/255), name: "Si", verticalOffset: 0),
                NoteBarConfig(duration: 90, color: .purple, name: "La", verticalOffset: -13),
                NoteBarConfig(duration: 90, color: .blue, name: "Sol", verticalOffset: -25),
                NoteBarConfig(duration: 90, color: .green, name: "Fa", verticalOffset: -38),
                NoteBarConfig(duration: 90, color: .yellow, name: "Mi", verticalOffset: -49),
                NoteBarConfig(duration: 90, color: .orange, name: "Re", verticalOffset: -61),
                NoteBarConfig(duration: 90, color: .red, name: "do", verticalOffset: -73),
            ],
            disabledNotes: [""],
            lastNoteValueOff: "01000"
        )
    
}
