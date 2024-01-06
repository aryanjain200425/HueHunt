//
//  mainGameView.swift
//  DifferentColor
//
//  Created by Aryan Jain on 1/5/24.
//

import SwiftUI

struct mainGameView: View {
    @State var score: Int = 0
    
    
    @State var board: [[TileButton]] = {
        var counter = 0
        
        var rand = Int.random(in: 0...8)
        
        var views = [[TileButton]](repeating: [TileButton](repeating: TileButton(color: Color.green, chosenOne: false), count: 3), count: 3)
        
        var newColor = Color.red
        
        var maybeChosen = false
        
        for i in 0..<3 {
            for j in 0..<3 {
                if (counter == rand){
                    maybeChosen = true
                    newColor = Color.blue
                }
                else{
                    maybeChosen = false
                    newColor = Color.green
                }
                
                views[i][j] = TileButton(color: newColor, chosenOne: maybeChosen)
                
                counter = counter + 1
                
            }
        }
        return views
    }()
    
    
    
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
