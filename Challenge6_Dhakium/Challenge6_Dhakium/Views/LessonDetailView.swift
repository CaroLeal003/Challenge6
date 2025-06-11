//
//  LessonDetailView.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 17/05/25.
//

import SwiftUI

struct LessonDetailView: View {
    
    @ObservedObject var bluetooth: BluetoothViewModel
    @Binding var isInGame: Bool
    @Binding var showGame: Bool
    let lesson: MusicNote
    let game: RythmGame
    let onWinAndDismiss: () -> Void
    
    func buttonClicked(valueToSend : String, disabled: Bool){
        if !disabled {
            bluetooth.send(command: valueToSend + "\n")
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 45)
                .fill(Color.white)
                .frame(width: UIDevice.isPad ? 1000 : 730, height: UIDevice.isPad ? 600 : 360)
                .shadow(radius: 5)
            
            NoteExplanation(lesson: lesson, bluetooth: bluetooth)
                .frame(width: 440)
                .offset(x: -85, y: 0)
            
            Image(lesson.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: UIDevice.isPad ? 280 : 180, height: UIDevice.isPad ? 170 : 100)
                .offset(x: UIDevice.isPad ? -280 : -230, y: UIDevice.isPad ? -140 : -95)
            
            Button(action: {
                withAnimation {
                    showGame = true
                    isInGame = true
                }
            }, label: {
                Image("practice_button_image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIDevice.isPad ? 190 : 160)
            })
            .offset(x: UIDevice.isPad ? 380 : 250, y: UIDevice.isPad ? 160 : 113)
            
        }
        .ignoresSafeArea()
    }
    
}

#Preview {
    LessonDetailView(bluetooth: BluetoothViewModel(), isInGame: .constant(false), showGame: .constant(false), lesson: MusicNote.NoteForPreview, game: RythmGame.RythmGameForPreview, onWinAndDismiss: {})
}
