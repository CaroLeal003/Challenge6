//
//  HomeView.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 17/05/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Image("Image 1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .padding()
                
            NavigationLink(destination: ColorPadView(bluetooth: BluetoothViewModel())) {
                Text("PLAY")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: 250)
                    .padding(.vertical, 20)
                    .background(.accent)
                    .cornerRadius(15)
            }
            
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
    HomeView()
}
