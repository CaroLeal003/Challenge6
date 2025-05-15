//
//  ColorPadView 2.swift
//  Challenge6_Dhakium
//
//  Created by Alessandra Di Rosa on 08/05/25.
//


import SwiftUI

struct ColorPadView: View {
    @ObservedObject var bluetooth: BluetoothViewModel
    
    let buttons: [(color: Color, command: String)] = [
        (.red, "NOTE_Do"),
        (.orange, "NOTE_Re"),
        (.yellow, "NOTE_Mi"),
        (.green, "NOTE_Fa"),
        (.blue, "NOTE_Sol"),
        (.purple, "NOTE_La"),
        (Color(red: 244/255, green: 180/255, blue: 190/255), "NOTE_Si"),
        (Color(red: 200/255, green: 0/255, blue: 0/255), "NOTE_Do")
    ]
    
    // Modificato per 2 colonne
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            Image(.image1)
            Spacer()
            
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(0..<buttons.count, id: \.self) { index in
                    Button(action: {
                        let command = buttons[index].command + "\n"
                        bluetooth.send(command: command)
                    }) {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(buttons[index].color)
                            .frame(height: 125) // Altezza aumentata
                            .aspectRatio(1, contentMode: .fit) // Mantiene quadrati
                            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
                            .overlay(
                                Text(buttons[index].command.replacingOccurrences(of: "NOTE_", with: ""))
                                    .font(.title2.bold())
                                    .foregroundColor(.white)
                                    .shadow(radius: 3)
                            )
                    }
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
