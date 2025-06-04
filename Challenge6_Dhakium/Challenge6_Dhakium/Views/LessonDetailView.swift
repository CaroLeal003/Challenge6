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
                .frame(width: 730, height: 360)
            
            NoteExplanation(lesson: lesson, bluetooth: bluetooth)
                .frame(width: 440)
                .offset(x: -85, y: 10)
            
            Image(lesson.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 100)
                .offset(x: lesson.imageName == "SolImage" ? -220 : -230, y: -95)
            
            Button(action: {
                withAnimation {
                    showGame = true
                    isInGame = true
                }
            }, label: {
                Image("practice_button_image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160)
            })
            .offset(x: 250, y: 120)
            
        }
        .ignoresSafeArea()
    }
    
}

#Preview {
    LessonDetailView(bluetooth: BluetoothViewModel(), isInGame: .constant(false), showGame: .constant(false), lesson: MusicNote.NoteForPreview, game: RythmGame.RythmGameForPreview, onWinAndDismiss: {})
}
