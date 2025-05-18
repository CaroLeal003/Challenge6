//
//  MusicNoteInfoRow.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 17/05/25.
//

import SwiftUI

struct MusicNoteInfoRow: View {
    
    let lesson: MusicNote
    
    var body: some View {
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
        .padding(.vertical, 5)
    }
}

#Preview {
    MusicNoteInfoRow(lesson: MusicNote.NoteForPreview)
}
