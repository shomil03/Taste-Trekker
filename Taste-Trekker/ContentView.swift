//
//  ContentView.swift
//  Taste-Trekker
//
//  Created by Shomil Singh on 11/12/23.
//

import SwiftUI
struct ContentView: View {
    @AppStorage("pageNumber") var page : Int?
    @StateObject var fooditems = FoodItems()
    @State var spice_tolerance : Int = 0
    @State var hungerLevel : Int = 0
    @State var food = ""
    @StateObject var userdata = UserData()
    @ObservedObject private var viewModel = userViewModel()
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
                        //                        .frame(height: geometry.size.height * 0.70 )
                        .frame(height: UIScreen.main.bounds.height * 0.37)
                        //                        .clipped()
                        
                        
                        
                    }
                    //                    .frame(height: geometry.size.height * 0.70)
                    VStack{
                        ScrollView(.horizontal ,showsIndicators: false){
                            HStack
                            {
                                hunger_stepper(HungerLevel: $hungerLevel)
                                    .padding(.horizontal)
                                Spice_stepper(spice_tolerence: $spice_tolerance)
                                    .padding(.horizontal)
                            }
                            .padding()
                        }
                        
                        Button("Submit")
                        {
                            let response = ResponseData(SpicyLevel: spice_tolerance, HungerLevel: hungerLevel)
                            response.registerUser()
                            optional()
                            food = "food item for h\(hungerLevel) s\(spice_tolerance)"
                            let newFood = FoodItem(name: food)
                            withAnimation{
                                fooditems.items.insert(newFood, at: 0)
                            }
                            
                        }
                        .foregroundStyle(.teal)
                        .bold()
                        
                        
                        Rectangle()
                            .frame(height: 1)
                            .padding(.horizontal)
                    }
                    //                    .frame(height: geometry.size.height * 1.39)
                    .frame(height: UIScreen.main.bounds.height * 0.60)
                }
                VStack{
                    withAnimation(.easeIn){
                        Text(food)
                            .font(.headline)
                            .padding()
                    }
                    
                }
                
                
                
                List{
                    if(fooditems.items.count > 0)
                    {
                        Section("history")
                        {
                            ForEach(fooditems.items){ items in
                                Text(items.name)
                                
                            }
                            .onDelete(perform: removeItems)
                        }
                    }
                    
                }
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
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: Account_View(userdata: userdata)) {
                        Label(
                            title: {
                                Text("Account")
                                    .foregroundStyle(.black)
                            },
                            icon: {
                                Image(systemName: "person.crop.circle")
                            }
                        )
                    }
                }
            }
            .onAppear{
                viewModel.addNewData(UUID: "\(userdata.user.id)")

            }
        }
        
        .preferredColorScheme(.light)
        
        
        
        
    }
    func removeItems(atOffset : IndexSet)
    {
        fooditems.items.remove(atOffsets: atOffset)
    }
    func optional(){
        if let number = page {
            print(number)
        }
    }
 
}


#Preview {
    ContentView()
}
