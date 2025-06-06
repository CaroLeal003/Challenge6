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
    NSLocalizedString("Give access to Bluetooth so the t-shirt can work its magic.", comment: ""),
    NSLocalizedString("The t-shirt connects all by itself! Look for the icon to check if it’s ready.", comment: ""),
    NSLocalizedString("Are you ready to have fun with music?", comment: "")

]

let onboardingImages = [
    "game_explanation",
    "Ihy_happy_explanation",
    "game_explanation",
    "game_explanation",
    "Ihy_happy_explanation",
    "Ihy_happy_explanation"
]

struct OnboardingView: View {

    @State private var currentIndex = 0
    let texts = onboardingTexts
    let images = onboardingImages
    @Binding var onBoardingDone: Bool
    @ObservedObject var bluetooth: BluetoothViewModel = .init()
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            HStack {
                ZStack {
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
                    if(currentIndex == 4){
                        bluetooth.initBluetooth()
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
                    bluetooth.initBluetooth()
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
