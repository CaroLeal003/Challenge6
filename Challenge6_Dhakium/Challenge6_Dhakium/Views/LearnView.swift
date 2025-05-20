//
//  LearnView.swift
//  Challenge6_Dhakium
//
//  Created by Alessandra Di Rosa on 14/05/25.
//
//  LearnView.swift
import SwiftUI

struct LearnView: View {
    
    @ObservedObject var bluetooth: BluetoothViewModel
    let levels: [Level] = Level.allLevels
    
    var body: some View {
        NavigationStack {
            
            List {
                ForEach(levels) { level in
                    NavigationLink(destination: LessonDetailView(bluetooth: bluetooth, lesson: level.learn)) {
                        MusicNoteInfoRow(lesson: level.learn)
                    }
                    .listRowSeparatorTint(level.learn.color.opacity(0.8))
                    NavigationLink(destination: RythmGameView(game: level.game, bluetooth: bluetooth)) {
                        RythmGameRow(game: level.game)
                    }
                }
            }
            .navigationTitle("Learning")
        }
    }
}

#Preview {
    LearnView(bluetooth: BluetoothViewModel())
}
