//
//  HomeView.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 17/05/25.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var bluetoothVM: BluetoothViewModel
    let shopURL = URL(string: "https://open.spotify.com/track/4PTG3Z6ehGkBFwjybzWkR8?si=fed79a04714445e4")!
    @State private var moveUp = false
    @State private var showButtons = false
    @Binding var showLearn: Bool
    @Binding var showColorPad: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Image("Haptihy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: moveUp ? 500 : 800)
                    .offset(y: moveUp ? 40 : 120)
                    //.frame(width: 500)
                    //.offset(y: 40)
                    .animation(.easeInOut(duration: 1), value: moveUp)
                
                Spacer()
                
                
                HStack(alignment: .bottom, spacing: 30) {
                    Button(action: {
                        showColorPad = true
                    }, label: {
                        VStack {
                            Image("game_button_image")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 140, height: 120)
                                .shadow(radius: 5)
                                .padding(.bottom, 30)
                        }
                    })
                    
                    Button(action: {
                        showLearn = true
                    }, label: {
                        VStack {
                            Image("learn_button_image")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 180, height: 170)
                                .shadow(radius:4)
                        }
                    })
                    
                    Button(action: {
                        UIApplication.shared.open(shopURL)
                    }) {
                        VStack {
                            Image("shop_button_image")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 140, height: 120)
                                .shadow(radius: 5)
                                .padding(.bottom, 30)
                        }
                    }
                }
                .opacity(showButtons ? 1 : 0)
                .animation(.easeIn(duration: 1), value: showButtons)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    moveUp = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        showButtons = true
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView(bluetoothVM: BluetoothViewModel(), showLearn: .constant(false), showColorPad: .constant(false))
}
