//
//  GameManagerViewModel.swift
//  Animal Knowledge Quiz
//
//  Created by omrobbie on 03/03/22.
//

import SwiftUI

class GameManagerViewModel {
    var data: QuizModel = quizData[0]
}

extension GameManagerViewModel {
    static var quizData: [QuizModel] {
        [
            QuizModel(question: "Which is the fastest animal in the world?",
                      answer: "B",
                      optionList: [
                        QuizOption(id: 11, optionId: "A", option: "Turtle", color: .yellow),
                        QuizOption(id: 12, optionId: "B", option: "Cheetah", color: .red),
                        QuizOption(id: 13, optionId: "C", option: "Rabbit", color: .green),
                        QuizOption(id: 14, optionId: "D", option: "Leopard", color: .purple)
                      ]
                     ),
            
            QuizModel(question: "Which of these animals swims in upright position?",
                      answer: "C",
                      optionList: [
                        QuizOption(id: 21, optionId: "A", option: "See Lion", color: .yellow),
                        QuizOption(id: 22, optionId: "B", option: "Sea Urchin", color: .red),
                        QuizOption(id: 23, optionId: "C", option: "Seahorse", color: .green),
                        QuizOption(id: 24, optionId: "D", option: "Sea Slug", color: .purple)
                      ]
                     ),
            
            QuizModel(question: "Which is the world largest living fish?",
                      answer: "B",
                      optionList: [
                        QuizOption(id: 31, optionId: "A", option: "Manta Ray", color: .yellow),
                        QuizOption(id: 32, optionId: "B", option: "Whale Shark", color: .red),
                        QuizOption(id: 33, optionId: "C", option: "Marlin", color: .green),
                        QuizOption(id: 34, optionId: "D", option: "Sailfish", color: .purple)
                      ]
                     ),
        ]
    }
}
