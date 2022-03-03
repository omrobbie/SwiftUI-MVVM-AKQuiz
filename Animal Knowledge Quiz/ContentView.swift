//
//  ContentView.swift
//  Animal Knowledge Quiz
//
//  Created by omrobbie on 03/03/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: GameManagerViewModel
    
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            LinearGradient(colors: [.purple.opacity(0.4), .blue.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            if viewModel.model.quizCompleted {
                QuizCompletedView(viewModel: viewModel)
            } else {
                VStack {
                    ReusableText(text: "Animal Knowledge Quiz!", size: 30)
                        .padding()
                    
                    ReusableText(text: viewModel.model.quizModel.question, size: 25)
                        .lineLimit(3)
                        .frame(width: screenWidth - 20)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 15)
                            .foregroundColor(.gray)
                            .opacity(0.3)
                        
                        Circle()
                            .trim(
                                from: 0,
                                to: min(
                                    (viewModel.progress * viewModel.maxProgress) / 100,
                                    1))
                            .stroke(
                                LinearGradient(
                                    colors: [.orange, .red],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing),
                                style: StrokeStyle(
                                    lineWidth: 20,
                                    lineCap: .round,
                                    lineJoin: .round)
                                )
                            .rotationEffect(Angle(degrees: 270))
                            .animation(Animation.linear(duration: viewModel.timerDuration), value: viewModel.progress)
                        
                        ReusableText(text: String(Int(viewModel.progress)), size: 30)
                    }
                    .frame(width: 150, height: 150)
                    
                    Spacer()
                    
                    OptionGridView(viewModel: viewModel)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: GameManagerViewModel())
    }
}
