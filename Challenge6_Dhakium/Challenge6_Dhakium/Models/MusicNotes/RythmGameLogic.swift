//
//  RythmGameLogic.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 27/05/25.
//

import Foundation

extension RythmGameView {
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
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        didWin = true
                    }
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


extension ContentView {
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
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        didWin = true
                    }
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
