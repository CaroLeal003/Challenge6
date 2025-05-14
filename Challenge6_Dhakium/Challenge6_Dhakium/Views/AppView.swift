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
            // Bottom Play
            NavigationLink(destination:ColorPadView(bluetooth: BluetoothViewModel())) {
                Text("PLAY")
                    .font(.largeTitle)
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
            
            // Bottom Learn
            NavigationLink(destination: LearnView()) {
                Text("LEARN")
                    .font(.largeTitle)
                    .padding()
                    .background(.green)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}

#Preview {
    AppView()
}
