//
//  TileButton.swift
//  DifferentColor
//
//  Created by Aryan Jain on 1/5/24.
//

import SwiftUI

struct TileButton: View {
    
    let color: Color
    let chosenOne: Bool
    
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(color)
                .frame(width: 66, height: 66)
        })
    }
}

#Preview {
    TileButton(color: Color.red, chosenOne: false)
}
