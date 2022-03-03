//
//  ContentView.swift
//  Animal Knowledge Quiz
//
//  Created by omrobbie on 03/03/22.
//

import SwiftUI

struct ContentView: View {
    let viewModel: GameManagerViewModel
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            LinearGradient(colors: [.purple.opacity(0.4), .blue.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                ReusableText(text: "Animal Knowledge Quiz!", size: 30)
                    .padding()
                
                ReusableText(text: viewModel.data.question, size: 25)
                    .lineLimit(3)
                    .frame(width: UIScreen.main.bounds.size.width - 20, height: 60)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                OptionGridView(viewModel: viewModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: GameManagerViewModel())
    }
}
