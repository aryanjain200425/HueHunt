//
//  mainGameView.swift
//  DifferentColor
//
//  Created by Aryan Jain on 1/5/24.
//

import SwiftUI

struct mainGameView: View {
    var score: Int = 0
    var highScore: Int = 0
    var body: some View {
        VStack{
                //MARK: Score
                VStack{
                    Text("Score")
                    Text(String(score))
                }
                .padding(.bottom, 50)
                .font(.largeTitle)
                .foregroundColor(Color.black)
            
            //MARK: Board
            VStack{
                HStack{
                    TileButton(color: Color.green, chosenOne: false)
                    TileButton(color: Color.green, chosenOne: false)
                    TileButton(color: Color.green, chosenOne: false)
                }
                HStack{
                    TileButton(color: Color.green, chosenOne: false)
                    TileButton(color: Color.green, chosenOne: false)
                    TileButton(color: Color.green, chosenOne: false)
                }
                HStack{
                    TileButton(color: Color.green, chosenOne: false)
                    TileButton(color: Color.green, chosenOne: false)
                    TileButton(color: Color.green, chosenOne: false)
                }
                
            }
        }
    }
}

#Preview {
    mainGameView()
}
