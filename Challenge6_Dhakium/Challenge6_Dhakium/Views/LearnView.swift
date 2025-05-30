//
//  LearnView.swift
//  Challenge6_Dhakium
//
//  Created by Alessandra Di Rosa on 14/05/25.
//
//  LearnView.swift


import SwiftUI

struct LearnView: View {
    
    @ObservedObject var bluetooth: BluetoothViewModel
    let levels: [Level] = Level.allLevels
    @State var counter: Int = 0
    @State private var isInGame: Bool = false
    
    var body: some View {
        ZStack {
            LessonDetailView(
                bluetooth: bluetooth,
                isInGame: $isInGame,
                lesson: levels[counter].learn,
                game: levels[counter].game,
                onWinAndDismiss: {
                    if counter < levels.count - 1 {
                        counter += 1
                    }
                }
            )
            
            HStack {
                Button(action: {
                    counter -= 1
                }, label: {
                    Image("backward_arrow_image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                })
                .opacity(counter == 0 ? 0 : 1)
                
                Spacer()
                
                Button(action: {
                    counter += 1
                }, label: {
                    Image("forward_arrow_image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                })
                .opacity(counter == levels.count - 1 ? 0 : 1)
            }
            .frame(width: 750)
            .opacity(isInGame ? 0 : 1)
            
            VStack {
                Spacer()
                if !isInGame {
                    BottomDots(
                        total: levels.count,
                        currentIndex: counter,
                        notes: levels.map { $0.learn }
                    )
                    .padding(.bottom, 14)
                }
            }
        }
    }
}

#Preview {
    LearnView(bluetooth: BluetoothViewModel())
}
