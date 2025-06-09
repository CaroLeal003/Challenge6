//
//  MainView.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 06/06/25.
//

import SwiftUI

struct MainView: View {
    
    @State var onBoardingDone: Bool = false
    @ObservedObject var bluetooth: BluetoothViewModel = .init()
    var body: some View {
        ZStack {
            if !OnboardingManager.shared.shouldShowOnboarding() {
                OnboardingView(onBoardingDone: $onBoardingDone)
                    .transition(.opacity)
            } else {
                
                AppView(bluetooth: bluetooth)
                    .transition(.opacity)
                    .onAppear(){
                        bluetooth.initBluetooth()
                    }
            }
        }
        .animation(.easeInOut(duration: 0.6), value: onBoardingDone)
    }
}

#Preview {
    MainView()
}
