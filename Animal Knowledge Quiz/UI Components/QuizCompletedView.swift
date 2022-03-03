//
//  QuizCompletedView.swift
//  Animal Knowledge Quiz
//
//  Created by omrobbie on 03/03/22.
//

import SwiftUI

struct QuizCompletedView: View {
    let viewModel: GameManagerViewModel
    
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            Image(systemName: "gamecontroller.fill")
                .foregroundColor(.yellow)
                .font(.system(size: 120))
                .padding()
            
            Spacer().frame(height: 60)
            
            ReusableText(text: viewModel.model.quizWinningStatus
                         ? "You have completed the Game!"
                         : "Try again!",
                         size: 30)
                .frame(width: screenWidth - 20)
                .multilineTextAlignment(.center)
                .padding()
            
            ReusableText(text: viewModel.model.quizWinningStatus
                         ? "Thank you for playing!"
                         : "Better luck next time!",
                         size: 30)
            
            Button {
                viewModel.restartGame()
            } label: {
                HStack {
                    Image(systemName: "play.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .padding()
                    
                    SimpleText(text: "Play Again", size: 24)
                        .foregroundColor(.white)
                }
            }
            .frame(width: 300, height: 60)
            .background(.purple.opacity(0.7))
            .cornerRadius(30)
            .padding()
        }
    }
}
