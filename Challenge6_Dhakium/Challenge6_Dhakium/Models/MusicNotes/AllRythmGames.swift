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
                NoteBarConfig(duration: 70, color: .red, name: "do"),
                NoteBarConfig(duration: 90, color: .red, name: "do"),
                NoteBarConfig(duration: 70, color: .red, name: "do"),
                NoteBarConfig(duration: 90, color: .red, name: "do")
            ],
            disabledNotes: ["NOTE_Re", "NOTE_Mi", "NOTE_Fa", "NOTE_Sol", "NOTE_La", "NOTE_Si", "NOTE_Do"],
            lastNoteValueOff: "01000"
        ),
        RythmGame(
            level: 2,
            allBars: [
                NoteBarConfig(duration: 80, color: .orange, name: "Re"),
                NoteBarConfig(duration: 90, color: .red, name: "do"),
                NoteBarConfig(duration:  50, color: .orange, name: "Re"),
                NoteBarConfig(duration:  50, color: .orange, name: "Re"),
                NoteBarConfig(duration: 70, color: .red, name: "do"),

            ],
            disabledNotes: ["NOTE_Mi", "NOTE_Fa", "NOTE_Sol", "NOTE_La", "NOTE_Si", "NOTE_Do"],
            lastNoteValueOff: "01000"
        ),
        RythmGame(
            level: 3,
            allBars: [
                NoteBarConfig(duration: 70, color: .yellow, name: "Mi"),
                NoteBarConfig(duration: 70, color: .orange, name: "Re"),
                NoteBarConfig(duration: 70, color: .red, name: "do"),
                NoteBarConfig(duration: 70, color: .orange, name: "Re"),
                NoteBarConfig(duration: 90, color: .yellow, name: "Mi"),
                NoteBarConfig(duration: 90, color: .yellow, name: "Mi"),
                NoteBarConfig(duration: 90, color: .yellow, name: "Mi"),

            ],
            disabledNotes: ["NOTE_Fa", "NOTE_Sol", "NOTE_La", "NOTE_Si", "NOTE_Do"],
            lastNoteValueOff: "03000"
        ),
        RythmGame(
            level: 4,
            allBars: [
                NoteBarConfig(duration: 80, color: .green, name: "Fa"),
                NoteBarConfig(duration: 80, color: .red, name: "do"),
                NoteBarConfig(duration: 80, color: .green, name: "Fa"),
                NoteBarConfig(duration: 60, color: .red, name: "do"),
                NoteBarConfig(duration: 60, color: .orange, name: "Re"),
                NoteBarConfig(duration: 60, color: .yellow, name: "Mi"),
                NoteBarConfig(duration: 80, color: .green, name: "Fa"),
                

            ],
            disabledNotes: ["NOTE_Sol", "NOTE_La", "NOTE_Si", "NOTE_Do"],
            lastNoteValueOff: "04000"
        ),
        RythmGame(
            level: 5,
            allBars: [
                NoteBarConfig(duration: 70, color: .blue, name: "Sol"),
                NoteBarConfig(duration: 70, color: .green, name: "Fa"),
                NoteBarConfig(duration: 70, color: .yellow, name: "Mi"),
                NoteBarConfig(duration: 100, color: .blue, name: "Sol"),
                NoteBarConfig(duration: 100, color: .yellow, name: "Mi"),
                NoteBarConfig(duration: 100, color: .blue, name: "Sol"),

            ],
            disabledNotes: ["NOTE_La", "NOTE_Si", "NOTE_Do"],
            lastNoteValueOff: "05000"
        ),
        RythmGame(
            level: 6,
            allBars: [
                NoteBarConfig(duration: 60, color: .purple, name: "La"),
                NoteBarConfig(duration: 60, color: .blue, name: "Sol"),
                NoteBarConfig(duration: 60, color: .green, name: "Fa"),
                NoteBarConfig(duration: 60, color: .orange, name: "Re"),
                NoteBarConfig(duration: 80, color: .blue, name: "Sol"),
                NoteBarConfig(duration: 100, color: .purple, name: "La"),
                NoteBarConfig(duration: 100, color: .purple, name: "La"),

            ],
            disabledNotes: ["NOTE_Si", "NOTE_Do"],
            lastNoteValueOff: "06000"
        ),
        RythmGame(
            level: 7,
            allBars: [
                NoteBarConfig(duration: 60, color: Color(red: 244/255, green: 180/255, blue: 190/255), name: "Si"),
                NoteBarConfig(duration: 60, color: .blue, name: "Sol"),
                NoteBarConfig(duration: 60, color: .yellow, name: "Mi"),
                NoteBarConfig(duration: 60, color: .yellow, name: "Mi"),
                NoteBarConfig(duration: 80, color: Color(red: 244/255, green: 180/255, blue: 190/255), name: "Si"),
                NoteBarConfig(duration: 80, color: .blue, name: "Sol"),
                NoteBarConfig(duration: 100, color: Color(red: 244/255, green: 180/255, blue: 190/255), name: "Si"),

            ],
            disabledNotes: ["NOTE_Do"],
            lastNoteValueOff: "07000"
        ),
        RythmGame(
            level: 8,
            allBars: [
                NoteBarConfig(duration: 90, color: Color(red: 200/255, green: 0/255, blue: 0/255), name: "Do"),
                NoteBarConfig(duration: 90, color: Color(red: 244/255, green: 180/255, blue: 190/255), name: "Si"),
                NoteBarConfig(duration: 90, color: .purple, name: "La"),
                NoteBarConfig(duration: 90, color: .blue, name: "Sol"),
                NoteBarConfig(duration: 90, color: .green, name: "Fa"),
                NoteBarConfig(duration: 90, color: .yellow, name: "Mi"),
                NoteBarConfig(duration: 90, color: .orange, name: "Re"),
                NoteBarConfig(duration: 90, color: .red, name: "do"),
            ],
            disabledNotes: [""],
            lastNoteValueOff: "01000"
        )
    ]
    
    static let RythmGameForPreview: RythmGame =
        RythmGame(
            level: 10,
            allBars: [
                NoteBarConfig(duration: 150, color: .red, name: "do"),
                NoteBarConfig(duration: 150, color: .orange, name: "Re"),
                NoteBarConfig(duration: 150, color: .yellow, name: "Mi")
            ],
            disabledNotes: ["NOTE_Fa", "NOTE_Sol", "NOTE_La", "NOTE_Si", "NOTE_Do"],
            lastNoteValueOff: "03000"
        )
    
}
