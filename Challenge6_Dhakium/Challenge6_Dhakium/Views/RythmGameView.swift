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
    @State private var scrollOffset: CGFloat = 0
    
    init(game: RythmGame, bluetooth: BluetoothViewModel) {
        self.game = game
        self._progresses = State(initialValue: Array(repeating: 0.0, count: game.allBars.count))
        self.bluetooth = bluetooth
    }
    
    var body: some View {
        VStack {
            HStack {
                
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 20, height: 60)
                    .padding(.leading)
                
                RythmGameBars(scrollOffset: $scrollOffset) {
                    HStack(spacing: 16) {
                        ForEach(Array(game.allBars.enumerated()), id: \.1.id) { index, bar in
                            ZStack {
                                progressBar(progress: progresses[index], color: bar.color, totalWidth: bar.duration)

                                //Text(bar.name).font(.caption)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(height: 60)
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
            .padding()
        }
        .alert("You won!", isPresented: $didWin) {
            Button("Amazing", role: .cancel) { dismiss() }
        }
    }
    
    func progressBar(progress: Double, color: Color, totalWidth: Double) -> some View {
        let barWidth = CGFloat(progress) * totalWidth
        let isActive = progress > 0 && progress < 1.0

        return ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(color.opacity(0.3))
                .frame(width: totalWidth, height: 30)

            RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .frame(width: barWidth, height: 30)

            if isActive {
                Rectangle()
                    .fill(color.opacity(0.5))
                    .frame(width: 10, height: 35)
                    .shadow(color: color, radius: 10)
                    .offset(x: barWidth - 10, y: 0)
            }
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
            let increment = 0.05 * (100 / game.allBars[currentBarIndex].duration)
            progresses[currentBarIndex] += increment
            
            let barWidth = game.allBars[currentBarIndex].duration + 16
            let scrollIncrement = increment * barWidth * 0.7
            scrollOffset += scrollIncrement

            if progresses[currentBarIndex] >= 1.0 {
                progresses[currentBarIndex] = 1.0
                currentBarIndex += 1
                stopFilling()
                
                if currentBarIndex >= game.allBars.count {
                    didWin = true
                    stopFilling()
                    bluetooth.send(command: game.lastNoteValueOff + "\n")
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
    RythmGameView(game: RythmGame.RythmGameForPreview, bluetooth: BluetoothViewModel())
}
