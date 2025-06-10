//
//  OnboardingView.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 06/06/25.
//

import SwiftUI

let onboardingTexts = [
    NSLocalizedString("Hi there! 👋\nThis app helps kids \nwho can't hear well enjoy music!", comment: ""),
    NSLocalizedString("To feel the music, you’ll need a special t-shirt!", comment: ""),
    NSLocalizedString("Don’t worry! \nYou can get the \nt-shirt later in the app.", comment: ""),
    NSLocalizedString("To make the t-shirt work, we need Bluetooth!\nIt helps your phone talk to the t-shirt.", comment: ""),
    NSLocalizedString("When you tap a note, your phone sends a tiny message.\nThe t-shirt gets it, and the right motor vibrates!", comment: ""),
    NSLocalizedString("The t-shirt connects all by itself!\nLook for the icon to check if it’s ready.", comment: ""),
    NSLocalizedString("We don’t collect any data. It’s just music and fun!", comment: ""),
    NSLocalizedString("Are you ready to have fun with music?", comment: "")
]

let onboardingImages = [
    "game_explanation",
    "Ihy_happy_explanation",
    "game_explanation",
    "game_explanation",
    "Ihy_happy_explanation",
    "game_explanation",
    "game_explanation",
    "Ihy_happy_explanation"
]

let moreImages: [String] = [
    "",
    "shirt",
    "shop_button_image",
    "bluetoothImage",
    "connectionImage",
    "on",
    "",
    ""
]

let imageSize: [CGFloat] = [10, 200, 100, 200, 300, 100, 10, 10]

struct OnboardingView: View {

    @State private var currentIndex = 0
    let texts = onboardingTexts
    let images = onboardingImages
    @Binding var onBoardingDone: Bool
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            HStack {
                ZStack {
                    
                    Image(moreImages[currentIndex])
                        .resizable()
                        .scaledToFit()
                        .frame(width: imageSize[currentIndex], height: imageSize[currentIndex])
                        .offset(x: -150, y: 90)
                        .shadow(radius: 2)
                    
                    
                    Image(images[currentIndex])
                        .resizable()
                        .scaledToFit()
                        .frame(width: 430)
                    
                    Text(texts[currentIndex])
                        .font(.custom("BalooTamma-Regular", size: 18))
                        .foregroundStyle(Color(red: 0/255, green: 61/255, blue: 152/255))
                        .multilineTextAlignment(.center)
                        .frame(width: 280)
                        .offset(x: -60, y: -95)
                    
                    
                }
            }
            
            HStack {
                Button(action: {
                    if currentIndex > 0 {
                        currentIndex -= 1
                    }
                }, label: {
                    Image("backward_arrow_image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                })
                .disabled(currentIndex == 0)
                .opacity(currentIndex == 0 || currentIndex == texts.count - 1 ? 0 : 1)
                
                Spacer()
                
                Button(action: {
                    if currentIndex < texts.count - 1 {
                        currentIndex += 1
                    }
                }, label: {
                    Image("forward_arrow_image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                })
                .disabled(currentIndex == texts.count - 1)
                .opacity(currentIndex == texts.count - 1 ? 0 : 1)
            }
            .frame(width: 720)
            
            Button(action: {
                withAnimation {
                    currentIndex = texts.count - 1
                }
            }, label: {
                Image("skip_button_image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90)
            })
            .offset(x: 300, y: -130)
            .disabled(currentIndex == texts.count - 1)
            .opacity(currentIndex == texts.count - 1 ? 0 : 1)
            
            if currentIndex == texts.count - 1 {
                Button(action: {
                    withAnimation {
                        OnboardingManager.shared.setOnboardingSeen()
                        onBoardingDone = true
                    }
                }, label: {
                    Image("start_button_image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120)
                })
                .offset(x: -50, y: 120)
            }
        }
    }
}

#Preview {
    OnboardingView(onBoardingDone: .constant(false))
}
