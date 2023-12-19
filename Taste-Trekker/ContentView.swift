//
//  ContentView.swift
//  Taste-Trekker
//
//  Created by Shomil Singh on 11/12/23.
//

import SwiftUI

struct ContentView: View {
    @State var spice_tolerence : Int = 0
    @State var hungerLevel : Int = 0
    var food_items = ["Chicken Biryani" , "Paneer Tikka Masala" , "Chole Bhature" , "Butter Chicken " , "Rajma Chawal"]
    var body: some View {
        NavigationStack{
            VStack {
                GeometryReader{
                    geometry in
                    GeometryReader{ geo in
                        ZStack{
                            Image("food_doctor")
                                .resizable()
                                .scaledToFill()
                                .opacity(0.5)
                            
                        }
                        .frame(height: geo.size.height )
                        
                    }
                    .frame(height: geometry.size.height * 0.70)
                    VStack{
                        ScrollView(.horizontal){
                            HStack
                            {
                                hunger_stepper(HungerLevel: $hungerLevel)
                                    .padding(.horizontal)
                                Spice_stepper(spice_tolerence: $spice_tolerence)
                                    .padding(.horizontal)
                            }
                            .padding()
                        }
                        Button("Submit")
                        {
                            print("Submit")
                        }
                        .foregroundStyle(.teal)
                        .bold()
                        
                        Rectangle()
                            .frame(height: 1)
                            .padding(.horizontal)
                    }
                    .frame(height: geometry.size.height * 1.39)
                }
                List{
                    ForEach(food_items , id: \.self){ item in
                        HStack{
                            
                            Image("\(item)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            Text("\(item)")
                                .padding()
                        }
                        
                        
                    }
                }.listStyle(.plain)
                
            }
            .toolbar{
                ToolbarItem(placement: .principal){
                    VStack{
                        
                        Text("Taste Trekker")
                            .font(.title)
                            .italic()
                            .bold()
                            .padding(.top)
                        Rectangle()
                            .foregroundStyle(.black)
                            .frame(height: 1)
                        
                    }
                }
                ToolbarItem(placement: .topBarTrailing)
                {
                    Image(systemName: "person.crop.circle")
                }
            }
           
            
           
        }
        .preferredColorScheme(.light)
        
        
    }
 
}

#Preview {
    ContentView()
}
