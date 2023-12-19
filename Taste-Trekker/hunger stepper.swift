//
//  hunger stepper.swift
//  Taste-Trekker
//
//  Created by Shomil Singh on 19/12/23.
//

import SwiftUI

struct hunger_stepper: View {
    @Binding var HungerLevel : Int
    var body: some View {
        HStack{
            Image("hungry-cartoon")
                .resizable()
                .scaledToFit()
                .frame(width: 75 , height: 75)
            VStack{
                Text("Hunger level")
                    
                HStack{
                    Button{
                        if(HungerLevel > 0)
                        {
                            HungerLevel -= 1
                        }
                    } label: {
                        Image(systemName: "minus.circle.fill")
                    }
                    .foregroundStyle(.red)
                    .padding(.horizontal)
                    
                    Text("\(HungerLevel)")
                    
                    Button{
                        if(HungerLevel < 10){
                            HungerLevel += 1
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                    .foregroundStyle(.green)
                    .padding(.leading)
                }
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        
    }
}

#Preview {
    hunger_stepper(HungerLevel: .constant(5))
}
