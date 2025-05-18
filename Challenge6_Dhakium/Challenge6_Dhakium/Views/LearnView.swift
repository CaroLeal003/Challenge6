//
//  LearnView.swift
//  Challenge6_Dhakium
//
//  Created by Alessandra Di Rosa on 14/05/25.
//
//  LearnView.swift
import SwiftUI

struct LearnView: View {
    let lessons: [MusicNote] = MusicNote.AllMusicNotes
    let games: [RythmGame] = RythmGame.AllRythmGames
    
    var body: some View {
        NavigationStack {
            
            List {
                Section(header: Text("Lesson")) {
                    ForEach(lessons) { lesson in
                        NavigationLink(destination: LessonDetailView(bluetooth: BluetoothViewModel(), lesson: lesson)) {
                            MusicNoteInfoRow(lesson: lesson)
                        }
                        .listRowSeparatorTint(lesson.color.opacity(0.3))
                    }
                }
                
                
                Section(header: Text("Gaming")) {
                    ForEach(games) { game in
                        NavigationLink(destination: RythmGameView(game: game)) {
                            RythmGameRow(game: game)
                        }
                        .listRowSeparatorTint(game.allBars[0].color.opacity(0.6))
                    }
                }
            }
            .navigationTitle("Learning")
        }
    }
}

#Preview {
    LearnView()
}
