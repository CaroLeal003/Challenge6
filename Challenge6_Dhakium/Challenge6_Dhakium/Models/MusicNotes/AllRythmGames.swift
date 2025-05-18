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
                NoteBarConfig(duration: 50, color: .red, name: "do"),
                NoteBarConfig(duration: 70, color: .red, name: "do"),
                NoteBarConfig(duration: 50, color: .red, name: "do"),
                NoteBarConfig(duration: 70, color: .red, name: "do")
            ],
            disabledNotes: ["NOTE_Re", "NOTE_Mi", "NOTE_Fa", "NOTE_Sol", "NOTE_La", "NOTE_Si", "NOTE_Do"]
        ),
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
        ),
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
            disabledNotes: ["NOTE_Fa", "NOTE_Sol", "NOTE_La", "NOTE_Si", "NOTE_Do"]
        ),
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
            disabledNotes: ["NOTE_Sol", "NOTE_La", "NOTE_Si", "NOTE_Do"]
        ),
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
            disabledNotes: ["NOTE_La", "NOTE_Si", "NOTE_Do"]
        ),
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
            disabledNotes: ["NOTE_Si", "NOTE_Do"]
        ),
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
            disabledNotes: ["NOTE_Do"]
        ),
        RythmGame(
            level: 8,
            allBars: [
                NoteBarConfig(duration: 70, color: .red, name: "Do"),
                NoteBarConfig(duration: 70, color: Color(red: 244/255, green: 180/255, blue: 190/255), name: "Si"),
                NoteBarConfig(duration: 70, color: .purple, name: "La"),
                NoteBarConfig(duration: 70, color: .blue, name: "Sol"),
                NoteBarConfig(duration: 70, color: .green, name: "Fa"),
                NoteBarConfig(duration: 70, color: .yellow, name: "Mi"),
                NoteBarConfig(duration: 70, color: .orange, name: "Re"),
                NoteBarConfig(duration: 70, color: Color(red: 200/255, green: 0/255, blue: 0/255), name: "do"),
            ],
            disabledNotes: [""]
        )
    ]
    
    static let RythmGameForPreview: RythmGame =
        RythmGame(
            level: 1,
            allBars: [
                NoteBarConfig(duration: 50, color: .red, name: "do"),
                NoteBarConfig(duration: 70, color: .orange, name: "Re"),
                NoteBarConfig(duration: 50, color: .yellow, name: "Mi")
            ],
            disabledNotes: ["NOTE_Fa", "NOTE_Sol", "NOTE_La", "NOTE_Si", "NOTE_Do"]
        )
    
}
