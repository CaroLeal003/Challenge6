//
//  LessonDetailView.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 17/05/25.
//

import SwiftUI

struct LessonDetailView: View {
    
    @ObservedObject var bluetooth: BluetoothViewModel
    let lesson: MusicNote
    @State private var isButtonPressed = false
    @State var strength: Double = 0
    @State private var strengthTimer: Timer?
    
    func buttonClicked(valueToSend : String, disabled: Bool){
        if !disabled {
            bluetooth.send(command: valueToSend + "\n")
        }
    }
    
    var body: some View {
        ZStack {
            
            Image("BackgroundLessonView")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Spacer()
                
                Image("BackgroundNote")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .overlay(
                       
                        ZStack(alignment: .bottomLeading) {
                            Color.clear
                            VStack(alignment: .leading) {
                                                           Image("DoImage")
                                                               .resizable()
                                                               .scaledToFit()
                                                               .frame(width: 100)
                                                               .padding(.leading, 40)
                                                               .padding(.top, 20)
                                                           
                                                           Spacer()
                                                       }
                                                       .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            Image("BackgroundYellow")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 500)
                                .offset(x: 20, y: -20)
                                .overlay(
                                    VStack {
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
                                                            animateStrength(to: 40.0)
                                                        }
                                                    }
                                                    .onEnded { _ in
                                                        isButtonPressed = false
                                                        animateStrength(to: 00.0)
                                                        bluetooth.send(command: lesson.listMotorValuesOff + "\n")
                                                    }
                                            )
                                        
                                        WaveView(waveColor: lesson.color, frequency: lesson.frequencyWave, strength: $strength)
                                            .padding(.top, 5)
                                            .frame(width: 300)
                                    }
                                    .padding(.vertical)
                                )
                        }
                    )
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationTitle(lesson.scientificName)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func animateStrength(to target: CGFloat) {
        strengthTimer?.invalidate()
        
        let step: CGFloat = 2.0
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
    LessonDetailView(bluetooth: BluetoothViewModel(), lesson: MusicNote.NoteForPreview)
}
