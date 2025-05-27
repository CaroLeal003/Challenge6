//
//  RythmGameRow.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 18/05/25.
//

import SwiftUI

struct RythmGameRow: View {
    
    let game: RythmGame
    
    var body: some View {
        HStack(spacing: 15) {
            RoundedRectangle(cornerRadius: 10)
                .fill(game.allBars[0].color)
                .frame(width: 30, height: 30)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(game.allBars[0].name)
                    .font(.system(size: 20, weight: .bold))
            }
            
            Spacer()

            Text("Level " + String(game.level))
                .font(.system(.caption, design: .monospaced))
                .foregroundColor(.gray)
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    RythmGameRow(game: RythmGame.RythmGameForPreview)
}
