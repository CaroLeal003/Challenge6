//
//  RythmGameView.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 17/05/25.
//

import SwiftUI

struct RythmGameView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var bluetooth: BluetoothViewModel
    
    let game: RythmGame
    
    @State var progresses: [Double]
    @State var currentBarIndex = 0
    @State var didWin = false
    @State var timer: Timer? = nil
    @State var activeButtonName: String? = nil
    @State var scrollOffset: CGFloat = 0
    
    init(game: RythmGame, bluetooth: BluetoothViewModel) {
        self.game = game
        self._progresses = State(initialValue: Array(repeating: 0.0, count: game.allBars.count))
        self.bluetooth = bluetooth
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.colorWater
                    .ignoresSafeArea()
                    .opacity(0.61)
                
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color.colorLightYellow)
                    .frame(width: 745, height: 264)
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                    .frame(width: 709, height: 173)
                
                VStack(spacing: 20) {
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 709, height: 5)
                        .opacity(0.3)
                    
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 709, height: 5)
                        .opacity(0.3)
                    
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 709, height: 5)
                        .opacity(0.3)
                    
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 709, height: 5)
                        .opacity(0.3)
                    
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 709, height: 5)
                        .opacity(0.3)
                }
                
                VStack {
                    Spacer()
                    
                    HStack {
                        
                        RythmGameBarsView(game: game, progresses: progresses, scrollOffset: $scrollOffset)
                            .frame(height: 173)
                            .padding(.leading, 20)
                    }
                    
                    
                    ZStack {
                        Image("RythmGameRectangle")
                            .resizable()
                            .ignoresSafeArea()
                            .frame(height: 122)
                        
                        ButtonPad(
                            bluetooth: bluetooth,
                            disabledNotes: game.disabledNotes,
                            onNotePressed: { name in
                                activeButtonName = name
                                startFilling()
                            },
                            onNoteReleased: { _ in
                                stopFilling()
                                activeButtonName = nil
                            }
                        )
                        .frame(height: 122)
                    }
                }
                .padding(.top, 120)
                .alert("You won!", isPresented: $didWin) {
                    Button("Amazing", role: .cancel) { dismiss() }
                }
                
                Button(action: {
                    print("backward")
                    dismiss()
                }, label: {
                    Image("backward_arrow_image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                })
                .offset(x: -400, y: -140)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    RythmGameView(game: RythmGame.RythmGameForPreview, bluetooth: BluetoothViewModel())
}
