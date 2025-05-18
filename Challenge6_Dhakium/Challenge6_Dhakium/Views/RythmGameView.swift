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
    
    @State private var progresses: [Double]
    @State private var currentBarIndex = 0
    @State private var didWin = false
    @State private var timer: Timer? = nil
    @State private var activeButtonName: String? = nil
    
    init(game: RythmGame) {
        _progresses = State(initialValue: Array(repeating: 0.0, count: game.allBars.count))
        self.bluetooth = BluetoothViewModel()
        self.game = game
    }
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns) {
                ForEach(Array(game.allBars.enumerated()), id: \.1.id) { index, bar in
                    ZStack {
                        progressBar(progress: progresses[index], color: bar.color, totalWidth: bar.duration)
                        
                        Text(bar.name)
                            .font(.caption)
                    }
                }
            }
            .padding(.horizontal)
            
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
            )            .padding()
            
        }
        .alert("You won!", isPresented: $didWin) {
            Button("Amazing", role: .cancel) { dismiss() }
        }
    }
    
    func progressBar(progress: Double, color: Color, totalWidth: Double) -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.3))
                .frame(width: totalWidth, height: 30)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .frame(width: CGFloat(progress) * totalWidth, height: 30)
        }
    }
    
    func startFilling() {
        guard timer == nil,
              currentBarIndex < game.allBars.count,
              let buttonName = activeButtonName,
              buttonName == game.allBars[currentBarIndex].name else {
            return
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            let increment = 0.03
            progresses[currentBarIndex] += increment
            
            if progresses[currentBarIndex] >= 1.0 {
                progresses[currentBarIndex] = 1.0
                currentBarIndex += 1
                stopFilling()
                
                if currentBarIndex >= game.allBars.count {
                    didWin = true
                }
            }
        }
    }
    
    func stopFilling() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    RythmGameView(
        game: RythmGame.RythmGameForPreview)
}
