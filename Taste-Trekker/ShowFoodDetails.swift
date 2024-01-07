//
//  ShowFoodDetails.swift
//  Taste-Trekker
//
//  Created by Shomil Singh on 08/01/24.
//

import SwiftUI

struct ShowFoodDetails: View {
    @State var food_description : food
    var body: some View {
        NavigationStack{
            VStack{
                Image("plate")
                    .padding()
                Rectangle()
                    .frame(height: 1)
                    .padding()
                Text(food_description.Health_Info)
                    .font(.title)
                    .italic()
                    .padding()
                VStack(alignment: .leading){
                        Text("Calories \(food_description.Calories)")
                            .font(.footnote)
                            .padding()
                            .bold()
                        Text("Cuisine \(food_description.Cuisine)")
                            .font(.footnote)
                            .padding()
                            .bold()
                        
                        Text("Diet Type \(food_description.Diet_Type)")
                            .font(.footnote)
                            .padding()
                            .bold()
                        Text("Sevings \(food_description.Serving_Size)")
                            .font(.footnote)
                            .padding()
                            .bold()
                    
                    
                }
                .frame(maxWidth: .infinity , alignment : .leading)
                
                Spacer()
            }
            .navigationTitle(food_description.Name)
        }
    }
}

#Preview {
    ShowFoodDetails(food_description: food.init())
}
