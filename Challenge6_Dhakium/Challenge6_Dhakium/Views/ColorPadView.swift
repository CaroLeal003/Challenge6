//
//  ColorPadView 2.swift
//  Challenge6_Dhakium
//
//  Created by Alessandra Di Rosa on 08/05/25.
//

import SwiftUI

struct ColorPadView: View {
    @ObservedObject var bluetooth: BluetoothViewModel
    @State private var activeNote: MusicNote? = nil
    @State var strength: Double = 0
    @State private var strengthTimer: Timer?
    @State private var hasPressed = false
    @Binding var showColorPad: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.colorWater
                    .ignoresSafeArea()
                    .opacity(0.60)
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                    .frame(width: UIDevice.isPad ? 1000 : 709, height: UIDevice.isPad ? 450 : 215)
                    .padding(.bottom, UIDevice.isPad ? 100 : 120)
                
                HStack {
                    if let activeNote = activeNote {
                        WaveView(
                            waveColor: activeNote.color,
                            frequency: activeNote.frequencyWave,
                            strength: $strength
                        )
                        .frame(width: UIDevice.isPad ? 475 : 340, height: UIDevice.isPad ? 200 : 120)
                        .padding()
                    } else if !hasPressed {
                        Text("This is a free play mode\nExplore your creativity and create something amazing!")
                            .font(.custom("BalooTamma-Regular", size: UIDevice.isPad ? 35 : 25))
                            .foregroundStyle(Color(red: 0/255, green: 61/255, blue: 152/255))
                            .multilineTextAlignment(.center)
                            .transition(.opacity)
                            .animation(.easeInOut(duration: 0.4), value: hasPressed)
                            .frame(width: UIDevice.isPad ? 500 : 340)
                    }
                    
                    Spacer()
                    
                    Image("Ihy1")
                        .resizable()
                        .scaledToFit()
                        .frame(height: UIDevice.isPad ? 600 : 180)
                }
                .padding(.bottom, 120)
                .frame(width: UIDevice.isPad ? 950 : 600)
                .padding(.leading, UIDevice.isPad ? 100 : 0)
                
                ZStack {
                    Image("RythmGameRectangle")
                        .resizable()
                        .ignoresSafeArea()
                        .frame(width: UIDevice.isPad ? 1200 : 809, height: UIDevice.isPad ? 180 : 160)
                    
                    ButtonPad(
                        bluetooth: bluetooth,
                        disabledNotes: [],
                        onNotePressedFreeGame: { note in
                            if !hasPressed {
                                hasPressed = true
                            }
                            activeNote = note
                            animateStrength(to: 50.0)
                            SoundManager.shared.playSound(named: activeNote?.scientificName ?? "Do")
                        },
                        onNoteReleasedFreeGame: { _ in
                            animateStrength(to: 0.0)
                        }
                    )
                    .frame(height: 122)
                }
                .padding(.top, UIDevice.isPad ? 670 : 275)
                
                Button(action: {
                    showColorPad = false
                }, label: {
                    Image("backward_arrow_image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIDevice.isPad ? 60 : 40)
                })
                .offset(x: UIDevice.isPad ? -550 : -380, y: UIDevice.isPad ? -290 : -140)
            }
            .onChange(of: showColorPad) { _, _ in
                activeNote = nil
                hasPressed = false
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
    ColorPadView(bluetooth: BluetoothViewModel(), showColorPad: .constant(false))
}
