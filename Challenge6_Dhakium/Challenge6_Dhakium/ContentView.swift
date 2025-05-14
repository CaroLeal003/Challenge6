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
    
    @State private var isOn_2 = false
    @State private var sliderValue_2: Double = 128
    
    @StateObject var bluetooth = BluetoothViewModel()
    
    @State private var listMotorValues : [String] = [
        "01000",
        "02000",
        "03000",
        "04000",
        "05000",
        "06000",
    ]
    
    func sendMotorsON_OFF(isOn : Bool, index : Int, indexString : String){
        var value = ( isOn) ? "255" : "000"
        listMotorValues[index] = indexString + value
        _ = listMotorValues.joined(separator: "&")
        
        for currIndex in 0..<listMotorValues.count {
            
            if( listMotorValues[currIndex]  != "000"){  
                
                let message =  listMotorValues[currIndex] +
                (currIndex < listMotorValues.count-1 ? "#" : "") + "\n";
                
                //print(message);
                bluetooth.send( command: listMotorValues[currIndex] +
                    (currIndex < listMotorValues.count-1 ? "#" : "") + "\n")
            }
            
        }
    }
    
    func sendMotors(value : String, index : Int, indexString : String){
        listMotorValues[index] = (indexString + value)
        
        let commandToSend = listMotorValues.joined(separator: "&")
        
        for currIndex in 0..<listMotorValues.count {
            if(Int(listMotorValues[currIndex] ) ?? 0 > 0){
                bluetooth.send( command: listMotorValues[currIndex] +
                    (currIndex < listMotorValues.count-1 ? "#" : "") + "\n")
            }
            
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Toggle("Activate", isOn: $isOn)
                .padding()
                .onChange(of: isOn) { _, value in
                    sendMotorsON_OFF(isOn: value, index: 0,indexString: "01")
                }

            Slider(value: $sliderValue, in: 0...255, step: 10)
                .padding(.horizontal)
                .onChange(of: sliderValue) { _, newValue in
                    let formattedValue = String(format: "%03d", Int(newValue))
                    sendMotors(value: formattedValue, index: 0, indexString: "01")
                }
            
            Toggle("Activate", isOn: $isOn_2)
                .padding()
                .onChange(of: isOn_2) { _, value in
                    
                    sendMotorsON_OFF(isOn: value, index: 1,indexString: "02")
                    
                }

            Slider(value: $sliderValue_2, in: 0...255, step: 10)
                .padding(.horizontal)
                .onChange(of: sliderValue_2) { _, newValue in
                    let formattedValue = String(format: "%03d", Int(newValue))
                    
                    sendMotors(value: formattedValue, index: 1, indexString: "02")
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
