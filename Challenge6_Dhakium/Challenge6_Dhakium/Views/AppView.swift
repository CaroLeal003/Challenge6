//
//  ContentView.swift
//  Challenge6_Dhakium
//
//  Created by Alessandra Di Rosa on 14/05/25.
//


import SwiftUI

struct AppView: View {
    @State private var showLearn = false
    @State private var showColorPad = false
    @State private var showParentGate = false
    @ObservedObject var bluetooth: BluetoothViewModel = .init()

    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            HomeView(
                bluetoothVM: bluetooth,
                showLearn: $showLearn,
                showColorPad: $showColorPad,
                showParentGate: $showParentGate
            )
            .opacity(showLearn || showColorPad ? 0 : 1)
            .animation(.easeInOut(duration: 0.5), value: showLearn || showColorPad || showParentGate)

            LearnView(bluetooth: bluetooth, showLearn: $showLearn)
                .offset(y: showLearn ? 0 : UIScreen.main.bounds.height)
                .animation(.easeInOut(duration: 0.5), value: showLearn)

            ColorPadView(bluetooth: bluetooth, showColorPad: $showColorPad)
                .offset(x: showColorPad ? 0 : UIScreen.main.bounds.width)
                .animation(.easeInOut(duration: 0.5), value: showColorPad)
            
            ParentalGateView(showParentGate: $showParentGate)
                .offset(x: showParentGate ? 0 : UIScreen.main.bounds.width)
                .animation(.easeInOut(duration: 0.5), value: showParentGate)
            
        }
    }
}

#Preview {
    AppView(bluetooth: BluetoothViewModel())
}
