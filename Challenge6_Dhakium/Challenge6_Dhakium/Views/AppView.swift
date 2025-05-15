//
//  ContentView.swift
//  Challenge6_Dhakium
//
//  Created by Alessandra Di Rosa on 14/05/25.
//


import SwiftUI

struct AppView: View {
    var body: some View {
        NavigationStack { // navigation
            HomeView()
        }
    }
}

// HomeView
struct HomeView: View {
    var body: some View {
        
        VStack(spacing: 30) {
            Spacer()
            
            Image("Image 1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .padding()
                
            // Bottom Play
            NavigationLink(destination:ColorPadView(bluetooth: BluetoothViewModel())) {
                Text("PLAY")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: 250)
                    .padding(.vertical, 20)
                    .background(.accent)
                    .cornerRadius(15)
            }
            
            
            // Bottom Learn
            NavigationLink(destination: LearnView()) {
                Text("LEARN")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: 250)
                    .padding(.vertical, 20)
                    .background(.accent)
                    .cornerRadius(15)
                    .padding()

            }
            .padding(.top)
            Image("Image")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

#Preview {
    AppView()
}
