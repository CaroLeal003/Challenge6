//
//  ColorPadView 2.swift
//  Challenge6_Dhakium
//
//  Created by Alessandra Di Rosa on 08/05/25.
//


import SwiftUI
struct ColorPadView: View {
    @ObservedObject var bluetooth: BluetoothViewModel
    @State private var listMotorValues : [String] = [
        "01100", "02255", "03200", "04200",
        "05200", "06200", "07200", "08200",
    ]
    @State private var listMotorValuesOff : [String] = [
        "01000", "02000", "03000", "04000",
        "05000", "06000", "07000", "08000",
    ]
    
    let buttons: [(color: Color, command: String)] = [
        (.red, "NOTE_do"),
        (.orange, "NOTE_Re"),
        (.yellow, "NOTE_Mi"),
        (.green, "NOTE_Fa"),
        (.blue, "NOTE_Sol"),
        (.purple, "NOTE_La"),
        (Color(red: 244/255, green: 180/255, blue: 190/255), "NOTE_Si"),
        (Color(red: 200/255, green: 0/255, blue: 0/255), "NOTE_Do")
    ]
    
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
            
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(0..<buttons.count, id: \.self) { index in
                    let note = buttons[index].command
                    let isDisabled = disabledNotes.contains(note)

                    RoundedRectangle(cornerRadius: 24)
                        .fill(isDisabled ? Color.gray : buttons[index].color)
                        .frame(height: 125)
                        .aspectRatio(1, contentMode: .fit)
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
                        .overlay(
                            Text(note.replacingOccurrences(of: "NOTE_", with: ""))
                                .font(.title2.bold())
                                .foregroundColor(.white)
                                .shadow(radius: 3)
                        )
                        .gesture(
                            LongPressGesture(minimumDuration: 0)
                                .onEnded { _ in
                                    buttonClicked(valueToSend: listMotorValues[index], disabled: isDisabled)
                                }
                        )
                        .simultaneousGesture(
                            DragGesture(minimumDistance: 0)
                                .onEnded { _ in
                                    buttonClicked(valueToSend: listMotorValuesOff[index], disabled: isDisabled)
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
