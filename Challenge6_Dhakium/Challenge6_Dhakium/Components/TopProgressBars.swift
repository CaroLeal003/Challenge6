//
//  TopProgressBars.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 29/05/25.
//

import SwiftUI

struct TopProgressBars: View {
    let total: Int
    let currentIndex: Int
    let notes: [MusicNote]
    
    var body: some View {
        HStack(spacing: 12) {
            ForEach(0..<total, id: \.self) { index in
                RoundedRectangle(cornerRadius: 10)
                    .fill(index <= currentIndex ? notes[index].color : Color.gray.opacity(0.4))
                    .frame(width: UIDevice.isPad ? 100 : 50, height: 4)
            }
            .padding(.trailing, 5)
        }
    }
}

#Preview {
    TopProgressBars(total: 8, currentIndex: 0, notes: MusicNote.AllMusicNotes)
}
