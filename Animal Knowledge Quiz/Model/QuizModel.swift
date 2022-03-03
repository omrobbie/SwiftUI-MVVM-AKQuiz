//
//  QuizModel.swift
//  Animal Knowledge Quiz
//
//  Created by omrobbie on 03/03/22.
//

import SwiftUI

struct Quiz {
    let currentQuestionIndex: Int
    let quizModel: QuizModel
}

struct QuizModel {
    let question: String
    let answer: String
    let optionList: [QuizOption]
}

struct QuizOption: Identifiable {
    let id: Int
    let optionId: String
    let option: String
    let color: Color
    let isSelected: Bool
    let isMatched: Bool
}