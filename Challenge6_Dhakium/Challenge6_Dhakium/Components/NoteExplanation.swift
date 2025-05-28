//
//  NoteExplanation.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 28/05/25.
//

import SwiftUI

struct NoteExplanation: View {
    
    let lesson: MusicNote
    @State var strength: Double = 0
    @State private var strengthTimer: Timer?
    @State private var isButtonPressed = false
    @ObservedObject var bluetooth: BluetoothViewModel
    
    var body: some View {
        ZStack {
            Image("detail_explain_image")
                .resizable()
                .scaledToFit()
            
            VStack {
                Spacer()
                Spacer()
                Spacer()
                
                Text("Press the button and feel the vibration")
                    .font(.custom("BalooTamma-Regular", size: 20))
                    .foregroundStyle(Color(red: 0/255, green: 61/255, blue: 152/255))
                
                ZStack {
                    WaveView(waveColor: lesson.color, frequency: lesson.frequencyWave, strength: $strength)
                        .frame(width: 400, height: 100)
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(lesson.color)
                        .frame(width: 100, height: 100)
                        .overlay(
                            Image(systemName: "music.note")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                                .foregroundColor(.white)
                        )
                        .shadow(radius: 5)
                        .scaleEffect(isButtonPressed ? 0.95 : 1.0)
                        .gesture(
                            LongPressGesture(minimumDuration: 0)
                                .onEnded { _ in
                                    bluetooth.send(command: lesson.listMotorValuesOn + "\n")
                                }
                        )
                        .simultaneousGesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { _ in
                                    if !isButtonPressed {
                                        isButtonPressed = true
                                        animateStrength(to: 30.0)
                                    }
                                }
                                .onEnded { _ in
                                    isButtonPressed = false
                                    animateStrength(to: 00.0)
                                    bluetooth.send(command: lesson.listMotorValuesOff + "\n")
                                }
                        )
                }
                Spacer()
            }
            
        }
    }
    
    func animateStrength(to target: CGFloat) {
        strengthTimer?.invalidate()
        
        let step: CGFloat = 1.0
        let interval = 0.01
        
        strengthTimer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { timer in
            if strength < target {
                strength = min(strength + step, target)
            } else if strength > target {
                strength = max(strength - step, target)
            }
            
            if strength == target {
                timer.invalidate()
            }
        }
    }
}

#Preview {
    NoteExplanation(lesson: MusicNote.NoteForPreview, bluetooth: BluetoothViewModel())
}
