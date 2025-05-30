//
//  ContentView.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 29/05/25.
//

import SwiftUI

struct ContentView: View {
    
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
        
        
        VStack {
            Spacer()
            
            HStack {
                
                RythmGameBarsView(game: game, progresses: progresses, scrollOffset: $scrollOffset)
            }
            
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
            
            
        }
        .padding(.top, 120)
    }
}

#Preview {
    ContentView(game: RythmGame.RythmGameForPreview, bluetooth: BluetoothViewModel())
}
