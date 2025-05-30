//
//  LessonDetailView.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 17/05/25.
//

import SwiftUI

struct LessonDetailView: View {
    
    @ObservedObject var bluetooth: BluetoothViewModel
    @Environment(\.dismiss) var dismiss
    @Binding var isInGame: Bool
    let lesson: MusicNote
    let game: RythmGame
    let onWinAndDismiss: () -> Void
    
    func buttonClicked(valueToSend : String, disabled: Bool){
        if !disabled {
            bluetooth.send(command: valueToSend + "\n")
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("BackgroundLessonView")
                    .resizable()
                    .scaledToFill()
                
                RoundedRectangle(cornerRadius: 45)
                    .fill(Color.white)
                    .frame(width: 770, height: 360)
                
                NoteExplanation(lesson: lesson, bluetooth: bluetooth)
                    .frame(width: 450)
                    .offset(x: -100, y: -15)
                
                Image(lesson.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 100)
                    .offset(x: lesson.imageName == "SolImage" ? -230 : -250, y: -120)
                
                Button(action: {
                    dismiss()
                }, label: {
                    Image("close_button_image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                })
                .offset(x: 340, y: -130)
                
                NavigationLink(destination: {
                    RythmGameView(game: game, bluetooth: bluetooth, onWinAndDismiss: onWinAndDismiss)
                        .onAppear {
                            isInGame = true
                        }
                        .onDisappear {
                            isInGame = false
                        }
                }, label: {
                    Image("practice_button_image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160)
                })
                .offset(x: 250, y: 100)
                
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
        }        
    }
}
