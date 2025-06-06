//
//  MainView.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 06/06/25.
//

import SwiftUI

struct MainView: View {
    
    @State var onBoardingDone: Bool = false
    
    var body: some View {
        ZStack {
            if onBoardingDone {
                AppView()
                    .transition(.opacity)
            } else {
                OnboardingView(onBoardingDone: $onBoardingDone)
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.6), value: onBoardingDone)
    }
}

#Preview {
    MainView()
}
