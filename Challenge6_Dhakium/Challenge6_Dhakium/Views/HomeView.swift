//
//  HomeView.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 17/05/25.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var bluetoothVM: BluetoothViewModel = .init()
    let shopURL = URL(string: "https://www.tuo-shop.com")!
    
    var body: some View {
        NavigationStack {
            ZStack {
              
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    Spacer()
                    
                
                    Image("Haptihy") 
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 500)
                        .padding(.bottom, 20)
                    
                    Spacer()
            
                   
                    HStack(alignment: .bottom, spacing: 30) {
                        NavigationLink(destination: ColorPadView(bluetooth: bluetoothVM)) {
                            VStack {
                                Image("game_button_image")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 140, height: 120)
                                    .shadow(radius: 5)
                                    .padding(.bottom, 30)
                            }
                        }
                        
                        NavigationLink(destination: LearnView(bluetooth: bluetoothVM)) {
                            VStack {
                                Image("learn_button_image")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 180, height: 170)
                                    .shadow(radius:4)
                            }
                        }
                        
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
                    .padding(.bottom, 10)
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .statusBar(hidden: true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
