//
//  OptionGridView.swift
//  Animal Knowledge Quiz
//
//  Created by omrobbie on 03/03/22.
//

import SwiftUI

struct OptionGridView: View {
    let viewModel: GameManagerViewModel
    
    let columns: [GridItem] = Array(repeating: GridItem(.fixed(170)), count: 2)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(viewModel.data.optionList) { quizOption in
                OptionCardView(option: quizOption)
            }
        }
    }
}

struct OptionCardView: View {
    let option: QuizOption
    
    var body: some View {
        VStack {
            if option.isMatched && option.isSelected {
                OptionStatusImageView(imageName: "checkmark")
            } else if !option.isMatched && option.isSelected {
                OptionStatusImageView(imageName: "xmark")
            } else {
                OptionView(option: option)
            }
        }
        .frame(width: 150, height: 150)
        .background(setBackgroundColor())
        .cornerRadius(40)
    }
    
    func setBackgroundColor() -> Color {
        if option.isMatched && option.isSelected {
            return .green
        } else if !option.isMatched && option.isSelected {
            return .red
        } else {
            return .white
        }
    }
}

struct OptionStatusImageView: View {
    let imageName: String
    
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(40)
            .foregroundColor(.white)
    }
}

struct OptionView: View {
    var option: QuizOption
    
    var body: some View {
        VStack {
            SimpleText(text: option.optionId, size: 30)
                .frame(width: 50, height: 50)
                .background(option.color.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(25)
            
            SimpleText(text: option.option, size: 20)
                .frame(width: 150, height: 38)
        }
    }
}
