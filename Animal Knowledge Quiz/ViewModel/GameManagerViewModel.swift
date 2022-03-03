//
//  GameManagerViewModel.swift
//  Animal Knowledge Quiz
//
//  Created by omrobbie on 03/03/22.
//

import SwiftUI

class GameManagerViewModel: ObservableObject {
    
    static var currentIndex: Int = 0
    
    static func createGameModel(index: Int) -> Quiz {
        Quiz(currentQuestionIndex: index, quizModel: quizData[index])
    }
    
    @Published var model = GameManagerViewModel.createGameModel(index: GameManagerViewModel.currentIndex)
    
    var timer = Timer()
    var timerDuration: Double = 1
    var maxProgress: CGFloat = 10
    
    @Published var progress: CGFloat = 0
    
    init() {
        start()
    }
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: timerDuration, repeats: true, block: { [weak self] _ in
            guard let self = self else { return }
            
            if self.progress >= self.maxProgress {
                self.model.quizCompleted = true
                self.model.quizWinningStatus = false
                self.reset()
            } else {
                self.progress += 1
            }
        })
    }
    
    func reset() {
        timer.invalidate()
        progress = 0
    }
    
    func verifyAnswer(selectedOption: QuizOption) {
        if let index = model.quizModel.optionList.firstIndex(where: { $0.optionId == selectedOption.optionId }) {
            let isMatched = selectedOption.optionId == model.quizModel.answer
            model.quizModel.optionList[index].isSelected = true
            model.quizModel.optionList[index].isMatched = isMatched
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                guard let self = self else { return }
                if isMatched {
                    if (GameManagerViewModel.currentIndex < GameManagerViewModel.quizData.count - 1) {
                        GameManagerViewModel.currentIndex += 1
                        self.model = GameManagerViewModel.createGameModel(index: GameManagerViewModel.currentIndex)
                    } else {
                        self.model.quizCompleted = true
                        self.model.quizWinningStatus = true
                    }
                }
                
                self.model.quizModel.optionList[index].isSelected = false
                self.model.quizModel.optionList[index].isMatched = false
            }
        }
    }
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
