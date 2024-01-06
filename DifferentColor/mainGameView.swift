//
//  mainGameView.swift
//  DifferentColor
//
//  Created by Aryan Jain on 1/5/24.
//

import SwiftUI

var numSquares = 5

struct mainGameView: View {
    
    @State var score: Int = 0
    
    @State var squareDim:CGFloat = 84-5.59*CGFloat(numSquares)
    
    @State var timeRemaining = 60
    
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        
    @State var isTimerRunning = false
    
    //for -5 display
    @State var isHidden: Bool = true
    
    
    
    @State var board: [[TileButton]] = {
        var counter = 0
        
        var rand = Int.random(in: 0...numSquares*numSquares-1)
        
        var views = [[TileButton]](repeating: [TileButton](repeating: TileButton(color: Color.green, chosenOne: false), count: numSquares), count: numSquares)
        
        var newColor = Color.red
        
        var maybeChosen = false
        
        for i in 0 ..< numSquares {
            for j in 0 ..< numSquares {
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
                ForEach(board, id: \.self){ array in
                    HStack{
                        ForEach(array, id: \.self){ element in
                            
                            Button(action: {
                                isTimerRunning = true
                                if (element.chosenOne && timeRemaining > 0){
                                    score += 1
                                    reshuffle()
                                    isHidden = true
                                }
                                
                                if (!element.chosenOne){
                                    timeRemaining -= 5
                                    
                                    isHidden = false
                                }
                            }, label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(element.color)
                                    .frame(width: squareDim, height: squareDim)
                            })
                        }
                    }}
                
            }
            
            
            VStack{
                Text("Time")
                    .padding(.trailing, 60)
                
                HStack{
                    Text("\(timeRemaining)")
                        .onReceive(timer) { _ in
                            if timeRemaining > 0 && isTimerRunning{
                                timeRemaining -= 1
                            }
                        }
                    
                    Text(" -5 ").foregroundColor(Color.red).opacity(isHidden ? 0 : 1)
                }
            }.font(.largeTitle).padding([.top, .leading], 50).foregroundColor(Color.black)
        }
    }
    
    
    
    func reshuffle(){
        
        numSquares = Int.random(in: 4...10)
        
        squareDim = 84-5.59*CGFloat(numSquares)
        
        let data2: [[TileButton]] = {
            
            var counter = 0
            
            let rand = Int.random(in: 0...numSquares*numSquares-1)
            
            var views = [[TileButton]](repeating: [TileButton](repeating: TileButton(color: Color.red, chosenOne: false), count: numSquares), count: numSquares)
            
            var maybeChosen = false
            
            let r:Double = Double(Int.random(in: 25...204))/255
            let b:Double = Double(Int.random(in: 25...204))/255
            let g:Double = Double(Int.random(in: 25...204))/255
            
            var newColor = Color(red: r, green: g, blue: b)
            
            for i in 0..<numSquares{
                for j in 0..<numSquares{
                    if(counter == rand){
                        maybeChosen = true
                        newColor = Color(red: r+0.2, green: g+0.2, blue: b+0.2)
                        
                    }
                    else{
                        maybeChosen = false
                        newColor = Color(red: r, green: g, blue: b)
                        
                    }
                    
                    views[i][j] = TileButton(color: newColor, chosenOne: maybeChosen)
                                       
                    counter = counter + 1
                }
            }
            
            return views
            
        }()
        
        
        board = data2

        
    }
}




#Preview {
    mainGameView()
}
