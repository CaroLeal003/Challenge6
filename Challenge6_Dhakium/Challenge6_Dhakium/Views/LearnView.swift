//
//  LearnView.swift
//  Challenge6_Dhakium
//
//  Created by Alessandra Di Rosa on 14/05/25.
//
//  LearnView.swift
import SwiftUI

struct MusicNoteLesson: Identifiable {
    let id = UUID()
    let noteName: String
    let scientificName: String
    let frequency: String
    let color: Color
}


struct LearnView: View {
    let lessons: [MusicNoteLesson] = [
        MusicNoteLesson(
            noteName: "Do",
            scientificName: "C4",
            frequency: "261.63 Hz",
            color: .red
        ),
        MusicNoteLesson(
            noteName: "Re",
            scientificName: "D4",
            frequency: "293.66 Hz",
            color: .orange
        ),
        MusicNoteLesson(
            noteName: "Mi",
            scientificName: "E4",
            frequency: "329.63 Hz",
            color: .yellow
        ),
        MusicNoteLesson(
            noteName: "Fa",
            scientificName: "F4",
            frequency: "349.23 Hz",
            color: .green
        ),
        MusicNoteLesson(
            noteName: "Sol",
            scientificName: "G4",
            frequency: "392.00 Hz",
            color: .blue
        ),
        MusicNoteLesson(
            noteName: "La",
            scientificName: "A4",
            frequency: "440.00 Hz",
            color: .purple
        ),
        MusicNoteLesson(
            noteName: "Si",
            scientificName: "B4",
            frequency: "493.88 Hz",
            color: .pink
        ),
        MusicNoteLesson(
            noteName: "Do",
            scientificName: "C5",
            frequency: "523.25 Hz",
            color: .teal  // Alternativa: .cyan o .mint
        )
    ]
    
    var body: some View {
        NavigationStack {
            List(lessons) { lesson in
                NavigationLink(destination: LessonDetailView(lesson: lesson)) {
                    HStack(spacing: 15) {
                        Circle()
                            .fill(lesson.color)
                            .frame(width: 30, height: 30)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(lesson.noteName)
                                .font(.system(size: 20, weight: .bold))
                            
                            Text(lesson.scientificName)
                                .font(.system(.caption, design: .monospaced))
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        Text(lesson.frequency)
                            .font(.system(.callout, design: .monospaced))
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 8)
                }
                .listRowSeparatorTint(lesson.color.opacity(0.3))
            }
            .navigationTitle("Lessons")
            .listStyle(.insetGrouped)
        }
    }
}

struct LessonDetailView: View {
    let lesson: MusicNoteLesson
    @State private var isButtonPressed = false
    
    var body: some View {
        VStack(spacing: 25) { // Ridotto lo spacing
           
            // Cerchio principale
            Circle()
                .fill(lesson.color)
                .frame(width: 150, height: 150)
                .overlay(
                    Text(lesson.noteName)
                        .font(.system(size: 40, weight: .black))
                )
                .shadow(color: lesson.color.opacity(0.4), radius: 15)
            
            // Box informazioni
            VStack(spacing: 10) {
                InfoRow(label: "Name", value: lesson.scientificName)
                InfoRow(label: "Frequency", value: lesson.frequency)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(.secondarySystemBackground))
            )
            .padding(.horizontal)
            
            // Bottone
            Button(action: {
                isButtonPressed.toggle()
            }) {
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
            }
            
            Spacer() // Aggiunto secondo Spacer in basso
            Spacer() // Extra spazio in basso
        }
        .padding(.top, 40) // Padding aggiuntivo in alto
        .frame(maxHeight: .infinity)
        .navigationTitle(lesson.scientificName)
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct InfoRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Text(value)
                .font(.system(.body, design: .monospaced))
                .bold()
        }
    }
}


#Preview {
    LearnView()
}
