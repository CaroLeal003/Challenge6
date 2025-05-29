//
//  ColorPadView 2.swift
//  Challenge6_Dhakium
//
//  Created by Alessandra Di Rosa on 08/05/25.
//

import SwiftUI

struct ColorPadView: View {
    @ObservedObject var bluetooth: BluetoothViewModel
    @Environment(\.dismiss) var dismiss
    @State private var activeNote: MusicNote? = nil
    @State var strength: Double = 0
    @State private var strengthTimer: Timer?
    @State private var hasPressed = false

    
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
                    .padding(.bottom, 30)
                
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .frame(width: 350, height: 140)
                        .border(Color.colorWater, width: 2)

                    if let activeNote = activeNote {
                        WaveView(
                            waveColor: activeNote.color,
                            frequency: activeNote.frequencyWave,
                            strength: $strength
                        )
                        .frame(width: 300, height: 90)
                        .padding()
                    } else if !hasPressed {
                        Text("This is a free play mode\nExplore your creativity and create something amazing!")
                            .font(.custom("BalooTamma-Regular", size: 20))
                            .foregroundStyle(Color(red: 0/255, green: 61/255, blue: 152/255))
                            .multilineTextAlignment(.center)
                            .transition(.opacity)
                            .animation(.easeInOut(duration: 0.4), value: hasPressed)
                    }
                }
                    Spacer()
                    
                    Image("Ihy")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 170)
                }
                .padding(.bottom, 30)
                .frame(width: 600)
                
                ZStack {
                    Image("RythmGameRectangle")
                        .resizable()
                        .ignoresSafeArea()
                        .frame(height: 122)
                    
                    ButtonPad(
                        bluetooth: bluetooth,
                        disabledNotes: [],
                        onNotePressedFreeGame: { note in
                            if !hasPressed {
                                hasPressed = true
                            }
                            activeNote = note
                            animateStrength(to: 30.0)
                        },
                        onNoteReleasedFreeGame: { _ in
                            animateStrength(to: 0.0)
                        }
                    )


                    .frame(height: 122)
                }
                .padding(.top, 310)
                
                Button(action: {
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
    ColorPadView(bluetooth: BluetoothViewModel())
}
