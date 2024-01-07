//
//  onBoardingScreenView2.swift
//  Taste-Trekker
//
//  Created by Shomil Singh on 21/12/23.
//

import SwiftUI
//enum DietPrefrence : String, CaseIterable ,Identifiable{
//    var id: Self { self }
//    case Vegetarian
//    case Non_Vegetarian
//}
struct onBoardingScreenView2: View {
    @State var healthIssue : [String]
    @State private var showingScreen2 = false
    @Binding var page : Int
    @FocusState var hideKeyboard : Bool
    @ObservedObject var userdata = UserData()
    @State var dietType : DietPrefrence
    @ObservedObject private var viewModel = userViewModel()
    var body: some View {
        NavigationStack{
            
            ZStack{
                Color.yellow
                    .ignoresSafeArea()
                VStack{
                    
                    VStack {
                        Text("What you like to eat")
                            .padding()
                            .padding(.top)
                        .font(Font.custom("ChalkboardSE-Regular", size: 28))
                    }
                    Spacer()
                    List{
                        Section(){
                            Text("Your Diet Prefrence:")
                            Picker("", selection: $dietType){
                                ForEach(DietPrefrence.allCases ,id: \.self){diet in
                                    Text(diet.rawValue)
                                }
                            }.pickerStyle(.segmented)
                                .background(.yellow)
                            
                            
                        }
                        Section{
                            VStack{
                                Text("Any health problem:")
                                Text("eg : sugar etc")
                                    .font(.caption)
                                    .opacity(0.5)
                            }
                            ForEach(0..<(healthIssue.count) , id: \.self){index in
                                TextField(" specify health issue", text: $healthIssue[index])
                                    .focused($hideKeyboard)
                            }.onDelete(perform: removeItems)
                            
                            
                            
                            
                            Button("Add health issue"){
                                healthIssue.append("")
                            }
                            
                            
                            
                            
                        }
                        
                    }
                    .tint(.yellow)
                    .background(.yellow)
                    .scrollContentBackground(.hidden)
                    
                    Button("Continue"){
                        
                        userdata.updateDiet(dietType: dietType, healthIssues: healthIssue)
                        showingScreen2 = true
                        page = 3
                        print(page)
                        
                    }
                    .font(.title)
                    .bold()
                    .padding()
                    .background(Capsule().strokeBorder( Color.white , lineWidth: 5)
                        .frame(width: 250)
                                
                    )
                    .foregroundStyle(.white)
                    .navigationDestination(isPresented: $showingScreen2) {
                        ContentView(userdata: userdata, food_description: food.init()
                        ).navigationBarBackButtonHidden(true)
                    }

                    Spacer()
                    Spacer()
                    
                }
                .toolbar{
                    
                        ToolbarItem(placement: .keyboard)
                        {
                            
                            Button("Done")
                            {
                                hideKeyboard = false
                            }
                        }
                    
                }
                
            }
            .ignoresSafeArea(.keyboard)
            .preferredColorScheme(.light)
            
        }
    }
    func removeItems(atOffset : IndexSet)
    {
        healthIssue.remove(atOffsets: atOffset)
    }

}

#Preview {
    onBoardingScreenView2(healthIssue: [], page: .constant(3), dietType: .Vegetarian)
}
