//
//  RythmGameBarsView.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 27/05/25.
//

import SwiftUI

struct RythmGameBarsView: View {
    let game: RythmGame
    let progresses: [Double]
    @Binding var scrollOffset: CGFloat

    var body: some View {
        RythmGameBars(scrollOffset: $scrollOffset) {
            HStack(spacing: 30) {
                ForEach(Array(game.allBars.enumerated()), id: \.1.id) { index, bar in
                    ZStack {
                        GameBar(progress: progresses[index], color: bar.color, totalWidth: bar.duration)
                        //Text(bar.name).font(.caption)
                    }
                    .offset(y: -bar.verticalOffset)
                }
            }
            .padding(.horizontal)
        }
    }
}

