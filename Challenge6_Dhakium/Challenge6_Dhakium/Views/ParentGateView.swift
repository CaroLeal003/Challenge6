//
//  ParentGateView.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 06/06/25.
//

import SwiftUI



struct ParentalGateView: View {
    @State private var currentQuestion: ParentalGate?
    @State private var shuffledOptions: [String] = []
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isCorrect = false
    @Binding var showParentGate: Bool

    var body: some View {
        NavigationStack {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                    .opacity(0.61)
                
                VStack(spacing: 40) {
                    Text("Ask your parents")
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                    
                    if let question = currentQuestion {
                        Text(question.question)
                            .font(.title)
                            .multilineTextAlignment(.center)
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 20) {
                            ForEach(shuffledOptions, id: \.self) { option in
                                Button(action: {
                                    checkAnswer(selected: option)
                                }) {
                                    Text(option)
                                        .font(.title2)
                                        .bold()
                                        .frame(maxWidth: .infinity, minHeight: 80)
                                        .background(Color.colorWater.opacity(0.7))
                                        .foregroundStyle(Color.black)
                                        .cornerRadius(12)
                                }
                            }
                        }
                        .padding(.horizontal, 40)
                    }
                }
                .padding()
                .onChange(of: showParentGate, {
                    if showParentGate {
                        loadRandomQuestion()
                    }
                })
                .onAppear(perform: loadRandomQuestion)
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text(alertMessage),
                        dismissButton: .default(Text("OK"), action: {
                            if isCorrect {
                                if let url = URL(string: "https://haptihysupport.carrd.co") {
                                    showParentGate = false
                                    UIApplication.shared.open(url)
                                }
                            } else {
                                showParentGate = false
                            }
                        })
                    )
                }
                
                Button(action: {
                    showParentGate = false
                }, label: {
                    Image("backward_arrow_image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                })
                .offset(x: -380, y: -140)
            }
        }
        .navigationBarBackButtonHidden(true)
    }

    func loadRandomQuestion() {
        if let question = ParentalGate.allQuestions.randomElement() {
            currentQuestion = question
            shuffledOptions = question.options.shuffled()
        }
    }

    func checkAnswer(selected: String) {
        guard let correct = currentQuestion?.correctAnswer else { return }

        if selected == correct {
            alertMessage = "Agre verified. You're about to be redirected to a website."
            isCorrect = true
        } else {
            alertMessage = "Age not verified. Please get an adult"
            isCorrect = false
        }
        showAlert = true
    }
}

#Preview {
    ParentalGateView(showParentGate: .constant(false))
}
