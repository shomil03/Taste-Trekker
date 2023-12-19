//
//  Spice_stepper.swift
//  Taste-Trekker
//
//  Created by Shomil Singh on 19/12/23.
//

import SwiftUI

struct Spice_stepper: View {
    @Binding var spice_tolerence : Int
    var body: some View {
        HStack{
            Image("chillies")
                .resizable()
                .scaledToFit()
                .frame(width: 75 , height: 75)
            VStack{
                Text("Spice Tolerence")
                HStack{
                    Button{
                        if(spice_tolerence > 0){
                            spice_tolerence -= 1
                        }
                    } label: {
                        Image(systemName: "minus.circle.fill")
                            .foregroundStyle(.red)
                    }
                    .padding(.horizontal)
                    
                    Text("\(spice_tolerence)")
                    
                    Button{
                        if(spice_tolerence < 20){
                            spice_tolerence += 1
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
    Spice_stepper(spice_tolerence: .constant(19))
}
