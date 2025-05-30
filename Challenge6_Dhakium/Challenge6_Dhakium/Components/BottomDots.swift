//
//  BottomDots.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 29/05/25.
//

import SwiftUI

struct BottomDots: View {
    let total: Int
    let currentIndex: Int
    let notes: [MusicNote]
    
    var body: some View {
        HStack(spacing: 12) {
            ForEach(0..<total, id: \.self) { index in
                Circle()
                    .fill(index == currentIndex ? notes[index].color : Color.gray.opacity(0.4))
                    .frame(width: 14, height: 14)
            }
        }
    }
}

#Preview {
    BottomDots(total: 8, currentIndex: 0, notes: MusicNote.AllMusicNotes)
}
