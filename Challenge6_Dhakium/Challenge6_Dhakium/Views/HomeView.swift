//
//  HomeView.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 17/05/25.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var bluetoothVM: BluetoothViewModel = .init()
    //let shopURL = URL(string: "https://open.spotify.com/track/4PTG3Z6ehGkBFwjybzWkR8?si=fed79a04714445e4")!
    @State private var moveUp = false
    @State private var showButtons = false
    @State var showLearn: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
              
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                
                    Image("Haptihy") 
                        .resizable()
                        .scaledToFit()
                        .frame(width: moveUp ? 500 : 800)
                        .offset(y: moveUp ? 40 : 120)
                        .animation(.easeInOut(duration: 1), value: moveUp)
                    
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
                        .fullScreenCover(isPresented: $showLearn, content: {
                            LearnView(bluetooth: bluetoothVM)
                        })
                        
                        Button(action: {
                            //UIApplication.shared.open(shopURL)
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
                    // Esperamos 1 segundo y luego cambiamos el estado
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
