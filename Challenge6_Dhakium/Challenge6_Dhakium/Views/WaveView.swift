//
//  WaveView.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 17/05/25.
//

import SwiftUI

struct WaveView: View {
    
    @State private var phase = 0.0
    
    let waveColor: Color
    let frequency: Double
    @Binding var strength: Double
    
    var body: some View {
        ZStack {
            Wave(strength: strength, frequency: frequency, phase: phase)
                .stroke(waveColor, lineWidth: 5)
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                self.phase = .pi * 2
            }
        }
    }
}
