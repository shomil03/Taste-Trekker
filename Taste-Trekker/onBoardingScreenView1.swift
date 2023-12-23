//
//  onBoardingScreenView.swift
//  Taste-Trekker
//
//  Created by Shomil Singh on 20/12/23.
//

import SwiftUI
enum DietPrefrence : String, CaseIterable ,Identifiable , Codable{
    var id: Self { self }
    case Vegetarian
    case Non_Vegetarian
}

struct onBoardingScreenView: View {
    @Binding var page : Int
    @State var name : String = ""
    @State var weight : String = ""
    @State var DOB : Date = Date.now
    @State var height : String = ""
    @FocusState var hideKeyboard : Bool
    @State var showingAlert : Bool = false
    @State var showingScreen1 = false
    @ObservedObject var userdata = UserData()
    var body: some View {
        NavigationStack{
            
            ZStack {
                Color(.yellow)
                    .ignoresSafeArea()
                
                VStack{
                    VStack(alignment: .center){
                        Text("Lets know about you")
                            .padding()
                            .padding(.top)
                            .font(Font.custom("ChalkboardSE-Regular", size: 28))
                    }
                     
                        List{
                            Section{
                                Text("Enter your name:")
                                
                                TextField("Your name", text: $name)
                                    .focused($hideKeyboard)
                            }
                            
                            Section{
                                Text("Enter your date of birth")
                                
                                DatePicker("DOB", selection: $DOB , displayedComponents: .date)
                                    .datePickerStyle(.compact)
                                    .labelsHidden()
                                
                            }

                            Section{
                                Text("Weight:")
                                TextField("Weight in kg", text: $weight)
                                    .keyboardType(.decimalPad)
                                    .focused($hideKeyboard)
                            }
                            Section{
                                Text("Height:")
                                TextField("Height in cm", text: $height)
                                    .keyboardType(.decimalPad)
                                    .focused($hideKeyboard)
                                
                            }
                        }
                            .padding()
                            .listStyle(.insetGrouped)
                            .background(Color.yellow)
                            .tint(.yellow)
                            
                        .scrollContentBackground(.hidden)
                        .frame(maxHeight: .infinity)
                    
                    
                    
                    
                    Button("Continue"){
                        
                        userdata.updateUserData(name: name, weight: weight, height: height, DOB: DOB)
                        
                        page = 2
                        showingScreen1 = true
                        print("\(page)  on screen1")
                        
                    }
                        .font(.title)
                        .bold()
                        .padding()
                        .background(Capsule().strokeBorder( Color.white , lineWidth: 5)
                            .frame(width: 250)
                                    
                        )
                        .foregroundStyle(.white)
                        .navigationDestination(isPresented: $showingScreen1) {
                            onBoardingScreenView2(healthIssue: [""], page: .constant(2), dietType: .Vegetarian).navigationBarBackButtonHidden(true)
                        }
                        .disabled(name.isEmpty || weight.isEmpty || height.isEmpty)
                        .onTapGesture {
                            if(name.isEmpty || weight.isEmpty || height.isEmpty){
                                userdata.printData()
                                showingAlert = true
                            }
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
                .preferredColorScheme(.light)
                .alert("Input Field is empty", isPresented: $showingAlert){
                    Button("Ok",role : .cancel){
                        
                    }
                }
            }
                
                
                
                
                
                
                
                
                
                
                
            .ignoresSafeArea(.keyboard)
        }
    }
        
        
        
}
        


#Preview {
    onBoardingScreenView(page: .constant(2))
}
