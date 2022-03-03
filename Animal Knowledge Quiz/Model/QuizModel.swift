//
//  QuizModel.swift
//  Animal Knowledge Quiz
//
//  Created by omrobbie on 03/03/22.
//

import SwiftUI

struct Quiz {
    var currentQuestionIndex: Int
    var quizModel: QuizModel
    var quizCompleted: Bool = false
    var quizWinningStatus: Bool = false
}

struct QuizModel {
    let question: String
    let answer: String
    var optionList: [QuizOption]
}

struct QuizOption: Identifiable {
    let id: Int
    let optionId: String
    let option: String
    let color: Color
    var isSelected: Bool = false
    var isMatched: Bool = false
}
