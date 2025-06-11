//
//  RythmGameView.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 17/05/25.
//

import SwiftUI

struct RythmGameView: View {
    let onWinAndDismiss: () -> Void
    @ObservedObject var bluetooth: BluetoothViewModel
    
    let game: RythmGame
    
    @State var progresses: [Double]
    @State var currentBarIndex = 0
    @State var didWin = false
    @State var timer: Timer? = nil
    @State var activeButtonName: String? = nil
    @State var scrollOffset: CGFloat = 0
    @State var closeExplanation: Bool = false
    let onDismiss: () -> Void
    
    init(game: RythmGame, bluetooth: BluetoothViewModel, onWinAndDismiss: @escaping () -> Void, onDismiss: @escaping () -> Void) {
        self.game = game
        self._progresses = State(initialValue: Array(repeating: 0.0, count: game.allBars.count))
        self.bluetooth = bluetooth
        self.onWinAndDismiss = onWinAndDismiss
        self.onDismiss = onDismiss
    }
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.colorWater
                    .ignoresSafeArea()
                    .opacity(0.61)
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                    .frame(width: UIDevice.isPad ? 1000 : 709, height: UIDevice.isPad ? 450 : 215)
                    .padding(.bottom, UIDevice.isPad ? 100 : 120)
                
                VStack(spacing: UIDevice.isPad ? 50 : 20) {
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: UIDevice.isPad ? 1000 : 709, height: 5)
                        .opacity(0.3)
                    
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: UIDevice.isPad ? 1000 : 709, height: 5)
                        .opacity(0.3)
                    
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: UIDevice.isPad ? 1000 : 709, height: 5)
                        .opacity(0.3)
                    
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: UIDevice.isPad ? 1000 : 709, height: 5)
                        .opacity(0.3)
                    
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: UIDevice.isPad ? 1000 : 709, height: 5)
                        .opacity(0.3)
                }
                .padding(.bottom, 120)
                

                    Spacer()
                    
                    HStack {
                        RythmGameBarsView(game: game, progresses: progresses, scrollOffset: $scrollOffset)
                            .frame(width: UIDevice.isPad ? 1000 : 709, height: UIDevice.isPad ? 743 : 173)
                    }
                    
                    ZStack {
                        Image("RythmGameRectangle")
                            .resizable()
                            .ignoresSafeArea()
                            .frame(width: UIDevice.isPad ? 1200 : 809, height: UIDevice.isPad ? 180 : 160)
                        
                        ButtonPad(
                            bluetooth: bluetooth,
                            disabledNotes: game.disabledNotes,
                            onNotePressed: { name in
                                activeButtonName = name
                                if let scientificName = MusicNote.AllMusicNotes.first(where: { $0.noteName == activeButtonName })?.scientificName {
                                    SoundManager.shared.playSound(named: scientificName)
                                }
                                startFilling()
                            },
                            onNoteReleased: { _ in
                                stopFilling()
                                activeButtonName = nil
                            }
                        )
                        .frame(height: 122)
                    }
                    .padding(.top, UIDevice.isPad ? 670 : 275)
                
                Button(action: {
                    onDismiss()
                }, label: {
                    Image("backward_arrow_image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIDevice.isPad ? 60 : 40)
                })
                .offset(x: UIDevice.isPad ? -550 : -380, y: UIDevice.isPad ? -290 : -140)
                
                if didWin {
                    ZStack {
                        Color.black
                            .ignoresSafeArea()
                            .opacity(0.5)
                        
                        WinningView(onContinue: onWinAndDismiss)
                            .frame(width: UIDevice.isPad ? 1000 : 700, height: UIDevice.isPad ? 550 : 350)
                            .cornerRadius(20)
                    }
                }
                
                if !closeExplanation {
                    ZStack {
                        Color.black
                            .ignoresSafeArea()
                            .opacity(0.5)
                        
                        GameExplanationView(closeExplanation: $closeExplanation)
                            .frame(width: UIDevice.isPad ? 1000 : 700, height: UIDevice.isPad ? 550 : 350)
                            .cornerRadius(20)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    RythmGameView(
        game: RythmGame.RythmGameForPreview,
        bluetooth: BluetoothViewModel(),
        onWinAndDismiss: {},
        onDismiss: {}
    )
}


