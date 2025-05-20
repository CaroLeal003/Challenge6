//
//  ButtonPad.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 18/05/25.
//

import SwiftUI

struct ButtonPad: View {
    @ObservedObject var bluetooth: BluetoothViewModel
    var disabledNotes: [String]
    
    var onNotePressed: ((String) -> Void)?
    var onNoteReleased: ((String) -> Void)?
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    func buttonClicked(valueToSend: String, disabled: Bool) {
        if !disabled {
            bluetooth.send(command: valueToSend + "\n")
        }
    }
    
    var body: some View {
        let allNotes = MusicNote.AllMusicNotes
        
        LazyVGrid(columns: columns, spacing: 30) {
            ForEach(0..<allNotes.count, id: \.self) { index in
                let note = allNotes[index]
                let isDisabled = disabledNotes.contains(note.command)
                
                RoundedRectangle(cornerRadius: 24)
                    .fill(isDisabled ? Color.gray : note.color)
                    .frame(height: 125)
                    .aspectRatio(1, contentMode: .fit)
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
                    .overlay(
                        Text(note.noteName)
                            .font(.title2.bold())
                            .foregroundColor(.white)
                            .shadow(radius: 3)
                    )
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { _ in
                                if !isDisabled {
                                    buttonClicked(valueToSend: note.listMotorValuesOn, disabled: isDisabled)
                                    onNotePressed?(note.noteName)
                                    print(note.listMotorValuesOn)
                                }
                            }
                            .onEnded { _ in
                                if !isDisabled {
                                    buttonClicked(valueToSend: note.listMotorValuesOff, disabled: isDisabled)
                                    onNoteReleased?(note.noteName)
                                    print(note.listMotorValuesOff)
                                }
                            }
                    )
                    .opacity(isDisabled ? 0.5 : 1.0)
            }
        }
        .padding(.horizontal)
    }
}


#Preview {
    ButtonPad(bluetooth: BluetoothViewModel(), disabledNotes: ["NOTE_La", "NOTE_Si", "NOTE_Do"])
}
