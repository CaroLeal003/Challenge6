//
//  ColorPadView 2.swift
//  Challenge6_Dhakium
//
//  Created by Alessandra Di Rosa on 08/05/25.
//


import SwiftUI
struct ColorPadView: View {
    @ObservedObject var bluetooth: BluetoothViewModel
    
    // index of the buttons ot disable (based on the command)
    let disabledNotes: [String] = [ "NOTE_La", "NOTE_Si", "NOTE_Do"]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    func buttonClicked(valueToSend : String, disabled: Bool){
        if !disabled {
            bluetooth.send(command: valueToSend + "\n")
        }
    }
    
    var body: some View {
        VStack {
            Image(.image1)
            Spacer()
            
            let allNotes = MusicNote.AllMusicNotes
            
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(0..<allNotes.count, id: \.self) { index in
                    let isDisabled = disabledNotes.contains(allNotes[index].command)

                    RoundedRectangle(cornerRadius: 24)
                        .fill(isDisabled ? Color.gray : allNotes[index].color)
                        .frame(height: 125)
                        .aspectRatio(1, contentMode: .fit)
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
                        .overlay(
                            Text(allNotes[index].noteName)
                                .font(.title2.bold())
                                .foregroundColor(.white)
                                .shadow(radius: 3)
                        )
                        .gesture(
                            LongPressGesture(minimumDuration: 0)
                                .onEnded { _ in
                                    buttonClicked(valueToSend: allNotes[index].listMotorValuesOn, disabled: isDisabled)
                                    print(allNotes[index].listMotorValuesOn)
                                }
                        )
                        .simultaneousGesture(
                            DragGesture(minimumDistance: 0)
                                .onEnded { _ in
                                    buttonClicked(valueToSend: allNotes[index].listMotorValuesOff, disabled: isDisabled)
                                    print(allNotes[index].listMotorValuesOff)
                                }
                        )
                        .opacity(isDisabled ? 0.5 : 1.0)
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding(.top)
    }
}

#Preview {
    ColorPadView(bluetooth: BluetoothViewModel())
}
