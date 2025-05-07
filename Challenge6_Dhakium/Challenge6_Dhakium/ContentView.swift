//
//  ContentView.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 06/05/25.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var isOn = false
    @State private var sliderValue: Double = 128
    @StateObject var bluetooth = BluetoothViewModel()
    

    var body: some View {
        VStack(spacing: 20) {
            Toggle("Activate", isOn: $isOn)
                .padding()
                .onChange(of: isOn) { _, value in
                    let commandToSend = value ? "Turn On\n" : "Turn Off\n"
                    bluetooth.send(command: commandToSend)
                }

            Slider(value: $sliderValue, in: 0...255, step: 10)
                .padding(.horizontal)
                .onChange(of: sliderValue) { _, newValue in
                    let msg = "M01-\(Int(newValue))\n"
                    bluetooth.send(command: msg)
                    
                }


            Text("Intensity: \(Int(sliderValue))")
                .font(.caption)
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
