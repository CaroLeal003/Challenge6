//
//  WinningView.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 29/05/25.
//

import SwiftUI

struct WinningView: View {
    
    let winningPhrases: [String] = [
        NSLocalizedString("You're a star!", comment: ""),
        NSLocalizedString("Amazing job!", comment: ""),
        NSLocalizedString("Great work!", comment: ""),
        NSLocalizedString("Wow, incredible!", comment: ""),
        NSLocalizedString("You nailed it!", comment: ""),
        NSLocalizedString("You're unstoppable", comment: ""),
        NSLocalizedString("You're getting better and better!", comment: ""),
        NSLocalizedString("What a fantastic move!", comment: ""),
        NSLocalizedString("So much talent!", comment: ""),
        NSLocalizedString("That was like watching a pro!", comment: ""),
        NSLocalizedString("You really shined!", comment: "")]
    
    let images: [String] = ["Ihy1", "Ihy2"]
    
    @State private var currentMessage: String = ""
    @State private var currentImage: String = ""
    
    let onContinue: () -> Void
    
    var body: some View {
        ZStack {
            
            Color.white
            
            VStack {
                VStack(spacing: 0) {
                    Image(currentImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIDevice.isPad ? 440 : 300, height: UIDevice.isPad ? 340 : 180)
                    
                    Text(currentMessage)
                        .font(.custom("BalooTamma-Regular", size: UIDevice.isPad ? 60 : 40))
                        .foregroundStyle(Color(red: 0/255, green: 61/255, blue: 152/255))
                        .multilineTextAlignment(.center)
                        .lineSpacing(0)
                        .frame(height: UIDevice.isPad ? 70 : 50)
                }
                Button(action: {
                    onContinue()
                }, label: {
                    Image("continue_button_image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIDevice.isPad ? 250 : 150, height: UIDevice.isPad ? 80 : 70)
                })
            }
            .onAppear {
                if let random = winningPhrases.randomElement() {
                    currentMessage = random
                }
                if let randomImage = images.randomElement() {
                    currentImage = randomImage
                }
            }
        }
    }
}
