//
//  WinningView.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 29/05/25.
//

import SwiftUI

struct WinningView: View {
    @Environment(\.dismiss) var dismiss
    
    let winningPhrases: [String] = ["You're a star!", "Amazing job!", "Great work!", "Wow, incredible!", "You nailed it!", "You're unstoppable", "You're getting better and better!", "What a fantastic move!", "So much talent!", "That was like watching a pro!", "You really shined!"]
    @State private var currentMessage: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing: 0) {
                    Image("Ihy")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 180)
                    
                    Text(currentMessage)
                        .font(.custom("BalooTamma-Regular", size: 40))
                        .foregroundStyle(Color(red: 0/255, green: 61/255, blue: 152/255))
                        .multilineTextAlignment(.center)
                        .lineSpacing(0)
                        .frame(height: 50)
                }
                Button(action: {
                    dismiss()
                }, label: {
                    Image("continue_button_image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 70)
                })
            }
            .onAppear {
                if let random = winningPhrases.randomElement() {
                    currentMessage = random
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    WinningView()
}
