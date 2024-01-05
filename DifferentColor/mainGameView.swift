//
//  mainGameView.swift
//  DifferentColor
//
//  Created by Aryan Jain on 1/5/24.
//

import SwiftUI

struct mainGameView: View {
    var score: Int = 0
    var body: some View {
        VStack{
            VStack{
                Text("Score")
                Text(String(score))
            }.padding(.bottom, 50.0).font(.largeTitle).foregroundColor(Color.black)
        }
        TileButton(color: Color.green, chosenOne: false)
    }
}

#Preview {
    mainGameView()
}
