//
//  ReusableText.swift
//  Animal Knowledge Quiz
//
//  Created by omrobbie on 03/03/22.
//

import SwiftUI

struct ReusableText: View {
    var text: String
    var size: CGFloat
    
    var body: some View {
        Text(text)
            .font(.system(size: size, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .shadow(color: .purple, radius: 2, x: 0, y: 3)
    }
}
