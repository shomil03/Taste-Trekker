////
////  ContentView.swift
////  Taste-Trekker
////
////  Created by Shomil Singh on 11/12/23.
////
//
//import SwiftUI
//struct ContentView: View {
//    @AppStorage("pageNumber") var page : Int?
//    @StateObject var fooditems = FoodItems()
//    @State var spice_tolerance : Int = 0
//    @State var hungerLevel : Int = 0
//    @State var food = ""
//    @StateObject var userdata = UserData()
//    @StateObject private var viewModel = userViewModel()
//    @StateObject private var ViewModel = UserViewModel()
//    @State private var dataReceived : Bool = false
//    var body: some View {
//        NavigationStack{
//            ZStack {
//                VStack {
//       
//                    
//                    GeometryReader{
//                        geometry in
//                        GeometryReader{ geo in
//                            ZStack{
//                                Image("food_doctor")
//                                    .resizable()
//                                    .scaledToFill()
//                                    .opacity(0.5)
//                                
//                            }
//                            .frame(height: UIScreen.main.bounds.height * 0.37)
//                        }
//                        VStack{
//                            ScrollView(.horizontal ,showsIndicators: false){
//                                HStack
//                                {
//                                    hunger_stepper(HungerLevel: $hungerLevel)
//                                        .padding(.horizontal)
//                                    Spice_stepper(spice_tolerence: $spice_tolerance)
//                                        .padding(.horizontal)
//                                }
//                                .padding()
//                            }
//                            
//                            Button("Submit")
//                            {
//                                ViewModel.registerUser(SpicyLevel: spice_tolerance, HungerLevel: hungerLevel)
//                            }
//                            .foregroundStyle(.teal)
//                            .bold()
//                            .onReceive(ViewModel.$isLoading.combineLatest(ViewModel.$FoodResponse)) { isLoading, foodResponse in
//                                if !isLoading, let response = foodResponse {
//                                    food = response.Name
//                                    let newFood = FoodItem(name: food)
//                                    withAnimation {
//                                        if newFood.name.count > 0 {
//                                            fooditems.items.insert(newFood, at: 0)
//                                            dataReceived = true
//                                        }
//                                    }
//                                }
//                            }
//                            
//                            
//                            Rectangle()
//                                .frame(height: 0)
//                                .padding(.horizontal)
//                        }
//                        //                    .frame(height: geometry.size.height * 1.39)
//                        .frame(height: UIScreen.main.bounds.height * 0.60)
//                        
//                    }
//                    .frame(height: UIScreen.main.bounds.height * 0.45)
//                    
//                    
//                    
//                    VStack{
//                        if(dataReceived)
//                        {
//                            withAnimation(.easeIn){
//                                HStack{
//                                    Image("plate")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(height: 40)
//                                        .padding()
//                                    
//                                    Text(food)
//                                        .font(.headline)
//                                    
//                                        .frame( maxWidth: .infinity, maxHeight: 60)
//                                        
//                                        .padding()
//                                }
//                            }
//                        }
//                    }
//                    .padding()
//                        
//                        
//////                                                if let response = ViewModel.FoodResponse{
////                                                    Text(response.Name)
////                                                }
////                        }
//                        
//                    
//                    
//                    
//                    
//                    List{
//                        if(fooditems.items.count > 0)
//                        {
//                            Section("history")
//                            {
//                                ForEach(fooditems.items){ items in
//                                    HStack{
//                                        Image("plate")
//                                            .resizable()
//                                            .scaledToFit()
//                                            .frame(height: 40)
//                                            .padding()
//                                        VStack{
//                                            Text(items.name)
//                                                .font(.headline)
//                                            
//                                        }
//                                    }
//                                    .frame(maxHeight: 60)
//                                    
//                                    
//                                }
//                                .onDelete(perform: removeItems)
//                            }
//                        }
//                        
//                    }
//                }
//                .opacity(ViewModel.isLoading ? 0.4 : 1.0)
//                if(ViewModel.isLoading){
//                    withAnimation(){
//                        ProgressView("Loading")
//                    }
//                }
//            }
//                
//                
//                
//                
//                .toolbar{
//                    ToolbarItem(placement: .principal){
//                        VStack{
//                            
//                            Text("Taste Trekker")
//                                .font(.title)
//                                .italic()
//                                .bold()
//                                .padding(.top)
//                            Rectangle()
//                                .foregroundStyle(.black)
//                                .frame(width: 250, height: 1 )
//                                
//                                
//                            
//                            
//                        }
//                    }
//                    ToolbarItem(placement: .topBarTrailing) {
//                        NavigationLink(destination: Account_View(userdata: userdata)) {
//                            Label(
//                                title: {
//                                    Text("Account")
//                                        .foregroundStyle(.black)
//                                },
//                                icon: {
//                                    Image(systemName: "person.crop.circle")
//                                }
//                            )
//                        }
//                        
//                    }
//                    
//                }
//                
//                .onAppear{
//                    viewModel.addNewData(UUID: "\(userdata.user.id)")
//                    
//            
//            }
//        }
//        
//        .preferredColorScheme(.light)
//        
//        
//        
//        
//    }
//    func removeItems(atOffset : IndexSet)
//    {
//        fooditems.items.remove(atOffsets: atOffset)
//    }
//    func optional(){
//        if let number = page {
//            print(number)
//        }
//    }
// 
//}
//
//
//#Preview {
//    ContentView()
//}
//
//  HomeView.swift
//  Taste-Trekker
//
//  Created by Shomil Singh on 07/01/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var fooditems = FoodItems()
    @StateObject var userdata = UserData()
    @State var food = ""
    @State var spice_tolerance : Int = 0
    @State var hungerLevel : Int = 0
    @StateObject private var ViewModel = UserViewModel()
    @StateObject private var viewModel = userViewModel()
    @State private var dataReceived : Bool = false
    @State private var showSheet : Bool = false
    @State var food_description : food
    func removeItems(atOffset : IndexSet)
    {
        fooditems.items.remove(atOffsets: atOffset)
    }
    
    var body: some View {
        NavigationStack {
            VStack(){
                ZStack(alignment:.bottom)
                {
                    Image("food_doctor")
                        .resizable()
                        .scaledToFit()
                        .opacity(0.7)
                        .saturation(2.0)
                    ScrollView(.horizontal , showsIndicators: false)
                    {
                        HStack{
                            Spice_stepper(spice_tolerence: $spice_tolerance)
                                .padding(.horizontal)
                            hunger_stepper(HungerLevel: $hungerLevel)
                                .padding(.horizontal)
                        }
                        .padding()
                        
                    }
                    .offset(y: -30)
                    .padding()
                }
                .padding(.vertical , -40)
                
                Button("Submit")
                {
                    ViewModel.registerUser(SpicyLevel: spice_tolerance, HungerLevel: hungerLevel)
                }
                .foregroundStyle(.teal)
                .bold()
                
                //                .padding(.top , 25)
                .padding(.vertical)
                .onReceive(ViewModel.$isLoading.combineLatest(ViewModel.$FoodResponse)) { isLoading, foodResponse in
                    if !isLoading, let response = foodResponse {
                        food_description = response
                        food = response.Name
                        let newFood = FoodItem(name: food)
                        withAnimation {
                            if newFood.name.count > 0 {
                                fooditems.items.insert(newFood, at: 0)
                                dataReceived = true
                            }
                        }
                    }
                }

                VStack{
                    if(dataReceived)
                    {
                        withAnimation(.easeIn){
                            NavigationLink(destination: ShowFoodDetails(food_description: food_description), label: {
                                
                                VStack(alignment:.leading) {
                                    HStack(){
                                        Image("plate")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 40)
                                            .padding(.horizontal)
                                        
                                        VStack(alignment:.leading){
                                            Text(food)
                                                .font(.title)
                                                .bold()
                                                .padding(.top)
                                                .foregroundStyle(.black)
                                            
                                            HStack{
                                                Text("Calories : \( food_description.Calories)")
                                                    .font(.caption)
                                                    .italic()
                                                Text("Cuisine : \(food_description.Cuisine)")
                                                    .font(.caption)
                                                    .padding(.leading)
                                                    .italic()
                                                    
                                            }
                                            .foregroundStyle(.black)
                                            .padding(.bottom)
                                            
                                        }
                                        
//                                        .background(.red)
                                    }
                                    .padding(.horizontal)
                                
                                }
                            }
                            )
                        }.frame(maxWidth: .infinity , alignment: .leading)
                    }
                }
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 20).strokeBorder(.teal, lineWidth: 2))
                .padding(.horizontal)
                
                List{
                    if(fooditems.items.count > 0)
                    {
                        Section("history")
                        {
                            ForEach(fooditems.items){ items in
                                HStack{
                                    Image("plate")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 40)
                                        .padding()
                                    VStack{
                                        Text(items.name)
                                            .font(.headline)
                                        
                                    }
                                }
                                .frame(maxHeight: 60)
                            }
                            
                            
                            .onDelete(perform: removeItems)
                        }
                    }
                    
                }
                
                //                .background(.yellow)
                
                
                if(ViewModel.isLoading){
                    withAnimation(){
                        ProgressView("Loading")
                    }
                }
                Spacer()
                
                
            }
            .opacity(ViewModel.isLoading ? 0.4 : 1.0)
            
            
            .toolbar{
                ToolbarItem(placement: .principal){
                    VStack{
                        
                        Text("Taste Trekker")
                            .font(.title)
                            .italic()
                            .bold()
                            .padding(.top)
//                        Rectangle()
//                            .foregroundStyle(.black)
//                            .frame(width: 250, height: 1 )
                        
                        
                        
                        
                        
                        
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
                    }.tint(Color(.black))
                    
                }
                
            }
            
        }.preferredColorScheme(.light)
            .onAppear{
                viewModel.addNewData(UUID: "\(userdata.user.id)")
                
            }
    }
}
    

#Preview {
    ContentView(food_description: food.init())
}
