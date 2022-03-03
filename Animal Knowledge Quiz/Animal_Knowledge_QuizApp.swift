//
//  Animal_Knowledge_QuizApp.swift
//  Animal Knowledge Quiz
//
//  Created by omrobbie on 03/03/22.
//

import SwiftUI

@main
struct Animal_Knowledge_QuizApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: GameManagerViewModel())
        }
    }
}
