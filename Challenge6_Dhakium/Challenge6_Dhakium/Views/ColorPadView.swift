//
//  ColorPadView 2.swift
//  Challenge6_Dhakium
//
//  Created by Alessandra Di Rosa on 08/05/25.
//


import SwiftUI

struct ColorPadView: View {
    @ObservedObject var bluetooth: BluetoothViewModel

    // Lista di colori + command
    
    let buttons: [(color: Color, command: String)] = [
            (.red, "NOTE_0"),
            (.orange, "NOTE_1"),
            (.yellow, "NOTE_2"),
            (.green, "NOTE_3"),
            (.mint, "NOTE_4"),
            (.teal, "NOTE_5"),
            (.cyan, "NOTE_6"),
            (.blue, "NOTE_7"),
            (.indigo, "NOTE_8"),
            (.purple, "NOTE_9"),
            (.pink, "NOTE_10"),
            (.brown, "NOTE_11"),
            (.gray, "NOTE_12"),
            (.black, "NOTE_13"),
            (.white, "NOTE_14")
    ]

    // Layout
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack {
            
            Text("Feel the music!")
                .font(.title)
                .padding()


            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(0..<buttons.count, id: \.self) { index in
                    Button(action: {
                        let command = buttons[index].command + "\n"
                        bluetooth.send(command: command)
                    }) {
                        Rectangle()
                            .fill(buttons[index].color)
                            .frame(height: 100)
                            .cornerRadius(12)
                            .shadow(radius: 4)
                    }
                }
            }

            Spacer()
        }
        .padding()
    }
}


#Preview {
    ColorPadView(bluetooth: BluetoothViewModel())
}
