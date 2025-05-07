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
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 20) {
            Toggle("Activate", isOn: $isOn)
                .padding()
                .onChange(of: isOn) { _, value in
                    let commandToSend = value ? Int(sliderValue) : 0
                    bluetooth.send(command: "\(commandToSend)\n")
                }

            Slider(value: $sliderValue, in: 0...255, step: 1)
                .padding(.horizontal)
                .onChange(of: sliderValue) { _, newValue in
                    if isOn {
                        bluetooth.send(command: "\(Int(newValue))\n")
                    }
                }


            Text("Intensity: \(Int(sliderValue))")
                .font(.caption)
        }
        .padding()
        .onReceive(timer) { _ in
            if isOn {
                bluetooth.send(command: "\(Int(sliderValue))\n")
            }
        }
    }
}


#Preview {
    ContentView()
}
