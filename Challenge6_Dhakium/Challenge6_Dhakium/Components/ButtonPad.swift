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
        GridItem(.flexible())
    ]
    
    func buttonClicked(valueToSend: String, disabled: Bool) {
        if !disabled {
            bluetooth.send(command: valueToSend + "\n")
        }
    }
    
    @State private var activeNoteName: String? = nil
    
    var body: some View {
        let allNotes = MusicNote.AllMusicNotes
        
        LazyHGrid(rows: columns, spacing: 10) {
            ForEach(0..<allNotes.count, id: \.self) { index in
                let note = allNotes[index]
                let isDisabled = disabledNotes.contains(note.command)
                let isActive = activeNoteName == note.noteName
                
                ZStack {
                    Image(isActive ? note.imagePressed : note.imageUnpressed)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 85, height: 104)
                    
                    if isDisabled {
                        Image("DisabledNote")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 85, height: 104)
                    }
                }
                
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { _ in
                            if !isDisabled {
                                if activeNoteName != note.noteName {
                                    activeNoteName = note.noteName
                                    buttonClicked(valueToSend: note.listMotorValuesOn, disabled: isDisabled)
                                    onNotePressed?(note.noteName)
                                    //print(note.listMotorValuesOn)
                                    print(activeNoteName!)
                                    print(note.noteName)
                                    print(note.imagePressed)
                                    
                                }
                            }
                        }
                        .onEnded { _ in
                            if !isDisabled {
                                activeNoteName = nil
                                buttonClicked(valueToSend: note.listMotorValuesOff, disabled: isDisabled)
                                onNoteReleased?(note.noteName)
                                //print(note.listMotorValuesOff)
                                print(note.noteName)
                                print(note.imageUnpressed)
                            }
                        }
                )
                .opacity(isDisabled ? 0.5 : 1.0)
            }
        }
    }
}


#Preview {
    ButtonPad(bluetooth: BluetoothViewModel(), disabledNotes: ["NOTE_La", "NOTE_Si", "NOTE_Do"])
}
