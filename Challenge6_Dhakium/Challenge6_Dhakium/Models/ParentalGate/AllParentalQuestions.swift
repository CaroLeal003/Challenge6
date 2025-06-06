//
//  AllParentalGates.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 06/06/25.
//

import Foundation

extension ParentalGate {
    static let allQuestions: [ParentalGate] = [
        ParentalGate(
            question: NSLocalizedString("What is 8 + 5?", comment: ""),
            correctAnswer: "13",
            options: [
                "10",
                "13",
                "15",
                "12"
            ]
        ),
        ParentalGate(
            question: NSLocalizedString("Which number is the largest?", comment: ""),
            correctAnswer: "99",
            options: [
                "45",
                "99",
                "21",
                "10"
            ]
        ),
        ParentalGate(
            question: NSLocalizedString("What is the result of 7 x 6?", comment: ""),
            correctAnswer: "42",
            options: [
                "36",
                "40",
                "42",
                "48"
            ]
        ),
        ParentalGate(
            question: NSLocalizedString("In what year did World War II end?", comment: ""),
            correctAnswer: "1945",
            options: [
                "1939",
                "1945",
                "1950",
                "1918"
            ]
        ),
        ParentalGate(
            question: NSLocalizedString("What is a synonym for 'fast'?", comment: ""),
            correctAnswer: NSLocalizedString("Quick", comment: ""),
            options: [
                NSLocalizedString("Slow", comment: ""),
                NSLocalizedString("Quick", comment: ""),
                NSLocalizedString("Small", comment: ""),
                NSLocalizedString("Big", comment: ""),
            ]
        ),
        ParentalGate(
            question: NSLocalizedString("What is the capital of France?", comment: ""),
            correctAnswer: NSLocalizedString("Paris", comment: ""),
            options: [
                NSLocalizedString("Madrid", comment: ""),
                NSLocalizedString("Paris", comment: ""),
                NSLocalizedString("London", comment: ""),
                NSLocalizedString("Rome", comment: ""),
            ]
        ),
        ParentalGate(
            question: NSLocalizedString("Which planet is known as the Red Planet?", comment: ""),
            correctAnswer: NSLocalizedString("Mars", comment: ""),
            options: [
                NSLocalizedString("Venus", comment: ""),
                NSLocalizedString("Jupiter", comment: ""),
                NSLocalizedString("Mars", comment: ""),
                NSLocalizedString("Saturn", comment: ""),
            ]
        ),
        ParentalGate(
            question: NSLocalizedString("How many sides does a hexagon have?", comment: ""),
            correctAnswer: "6",
            options: [
                "4",
                "5",
                "6",
                "8"
            ]
        ),
        ParentalGate(
            question: NSLocalizedString("Who wrote 'Don Quixote'?", comment: ""),
            correctAnswer: "Miguel de Cervantes",
            options: [
                "Gabriel García Márquez",
                "Miguel de Cervantes",
                "Pablo Neruda",
                "Federico García Lorca"
            ]
        ),
        ParentalGate(
            question: NSLocalizedString("What gas do humans breathe to live?", comment: ""),
            correctAnswer: NSLocalizedString("Oxygen", comment: ""),
            options: [
                NSLocalizedString("Carbon dioxide", comment: ""),
                NSLocalizedString("Oxygen", comment: ""),
                NSLocalizedString("Nitrogen", comment: ""),
                NSLocalizedString("Helium", comment: ""),
            ]
        ),
        ParentalGate(
            question: NSLocalizedString("Which instrument has black and white keys?", comment: ""),
            correctAnswer: NSLocalizedString("Piano", comment: ""),
            options: [
                NSLocalizedString("Guitar", comment: ""),
                NSLocalizedString("Piano", comment: ""),
                NSLocalizedString("Trumpet", comment: ""),
                NSLocalizedString("Violin", comment: ""),
            ]
        ),
        ParentalGate(
            question: NSLocalizedString("Which is the largest ocean in the world?", comment: ""),
            correctAnswer: NSLocalizedString("Pacific Ocean", comment: ""),
            options: [
                NSLocalizedString("Atlantic Ocean", comment: ""),
                NSLocalizedString("Pacific Ocean", comment: ""),
                NSLocalizedString("Indian Ocean", comment: ""),
                NSLocalizedString("Arctic Ocean", comment: ""),
            ]
        ),
        ParentalGate(
            question: NSLocalizedString("Which shape has four equal sides and four right angles?", comment: ""),
            correctAnswer: NSLocalizedString("Square", comment: ""),
            options: [
                NSLocalizedString("Rectangle", comment: ""),
                NSLocalizedString("Rhombus", comment: ""),
                NSLocalizedString("Square", comment: ""),
                NSLocalizedString("Triangle", comment: ""),
            ]
        ),
        ParentalGate(
            question: NSLocalizedString("Which animal lays eggs and can fly?", comment: ""),
            correctAnswer: NSLocalizedString("Bird", comment: ""),
            options: [
                NSLocalizedString("Dog", comment: ""),
                NSLocalizedString("Cat", comment: ""),
                NSLocalizedString("Bird", comment: ""),
                NSLocalizedString("Mouse", comment: ""),
            ]
        ),
        ParentalGate(
            question: NSLocalizedString("What is the official language of Brazil?", comment: ""),
            correctAnswer: NSLocalizedString("Portuguese", comment: ""),
            options: [
                NSLocalizedString("Spanish", comment: ""),
                NSLocalizedString("Portuguese", comment: ""),
                NSLocalizedString("English", comment: ""),
                NSLocalizedString("French", comment: ""),
            ]
        ),
        ParentalGate(
            question: NSLocalizedString("How many legs does a spider have?", comment: ""),
            correctAnswer: "8",
            options: [
                "6",
                "8",
                "10",
                "12"
            ]
        ),
        ParentalGate(
            question: NSLocalizedString("Which organ pumps blood through the human body?", comment: ""),
            correctAnswer: NSLocalizedString("Heart", comment: ""),
            options: [
                NSLocalizedString("Lungs", comment: ""),
                NSLocalizedString("Liver", comment: ""),
                NSLocalizedString("Stomach", comment: ""),
                NSLocalizedString("Heart", comment: ""),
            ]
        ),
        ParentalGate(
            question: NSLocalizedString("What is the process of turning water into vapor called?", comment: ""),
            correctAnswer: NSLocalizedString("Evaporation", comment: ""),
            options: [
                NSLocalizedString("Condensation", comment: ""),
                NSLocalizedString("Evaporation", comment: ""),
                NSLocalizedString("Melting", comment: ""),
                NSLocalizedString("Sublimation", comment: ""),
            ]
        )
        
    ]
}
