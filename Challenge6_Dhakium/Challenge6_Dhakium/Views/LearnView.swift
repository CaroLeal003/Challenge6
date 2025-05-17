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
    
    var body: some View {
        NavigationStack {
            List(lessons) { lesson in
                NavigationLink(destination: LessonDetailView(lesson: lesson)) {
                    MusicNoteInfoRow(lesson: lesson)
                }
                .listRowSeparatorTint(lesson.color.opacity(0.3))
            }
            .navigationTitle("Lessons")
            .listStyle(.insetGrouped)
        }
    }
}

#Preview {
    LearnView()
}
