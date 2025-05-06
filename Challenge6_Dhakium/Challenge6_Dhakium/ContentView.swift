//
//  ContentView.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 06/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isOn = false
    @StateObject var bluetooth = BluetoothViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Toggle("Activate", isOn: $isOn)
                .padding()
                .onChange(of: isOn) { _, value in
                    bluetooth.send(command: value ? "1" : "0")
                    print("Sent: \(value ? "1" : "0")")
                }
            Text("Motor controlled by BLE")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
    }
}
 

#Preview {
    ContentView()
}
