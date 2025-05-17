//
//  LessonDetailView.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 17/05/25.
//

import SwiftUI

struct LessonDetailView: View {
    
    let lesson: MusicNote
    @State private var isButtonPressed = false
    @State var strength: Double = 0
    
    var body: some View {
        VStack(spacing: 25) {
            
            Circle()
                .fill(lesson.color)
                .frame(width: 150, height: 150)
                .overlay(
                    Text(lesson.noteName)
                        .foregroundStyle(Color.white)
                        .font(.system(size: 40, weight: .bold))
                )
                .shadow(color: lesson.color.opacity(0.4), radius: 15)
            
            VStack(spacing: 10) {
                MusicNoteInfoBox(label: "Name", value: lesson.scientificName)
                MusicNoteInfoBox(label: "Frequency", value: lesson.frequency)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(.secondarySystemBackground))
            )
            .padding(.horizontal)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(lesson.color)
                .frame(width: 200, height: 200)
                .overlay(
                    Image(systemName: "music.note")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                        .foregroundColor(.white)
                )
                .shadow(radius: 5)
                .scaleEffect(isButtonPressed ? 0.95 : 1.0)
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { _ in
                            if !isButtonPressed {
                                isButtonPressed = true
                                strength = 40.0
                            }
                        }
                        .onEnded { _ in
                            isButtonPressed = false
                            strength = 0.0
                        }
                )
            
            Spacer()
            
            WaveView(waveColor: lesson.color, frequency: lesson.frequencyWave, strength: $strength)

            Spacer()
        }
        .padding(.top, 40)
        .frame(maxHeight: .infinity)
        .navigationTitle(lesson.scientificName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LessonDetailView(lesson: MusicNote.NoteForPreview)
}
