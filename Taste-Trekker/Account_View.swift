//
//  Account_View.swift
//  Taste-Trekker
//
//  Created by Shomil Singh on 25/12/23.
//

import SwiftUI

struct Account_View: View {
    @StateObject var userdata = UserData()
    @ObservedObject private var viewModel = userViewModel()
    @State private var isDatePresented = false
    @State private var isPickerPresented = false
    var body: some View {
        
        NavigationStack{
            ZStack {
                Color(.yellow)
                    .ignoresSafeArea()
                VStack {
                    List{
                        Section(header:Text( "Personal Information")){
                            NavigationLink(destination: changeName(userdata: userdata) , label:{
                                HStack{
                                    Text("Name:")
                                    Spacer()
                                    Text("\(userdata.user.name)")
                                        .padding(.horizontal)
                                    
                                }
                            })
                            NavigationLink(destination: changeWeight(userdata: userdata, weight: ""), label: {
                                HStack{
                                    Text("Weight:")
                                    Spacer()
                                    Text("\(userdata.user.weight)")
                                }
                            })
                            NavigationLink(destination: changeWeight(userdata: userdata,weight: ""), label: {
                                HStack{
                                    Text("Height:")
                                    Spacer()
                                    Text("\(userdata.user.height)")
                                }
                            })
                            HStack{
                                Text("Date of birth :")
                                Spacer()
                                
                               Text("\((dateFormatter.string(from: viewModel.user.user.DOB)))")
                            }
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.8)){
                                    isDatePresented = true;
                                }
                            }
                            if isDatePresented{
                                Group{
                                    DatePicker("", selection: $userdata.user.DOB , displayedComponents: .date)
                                        .datePickerStyle(.graphical)
                                }
                                
                                 
                            }
                        }
                        .animation(.bouncy, value: isDatePresented)
                        Section(header: Text("Diet preference")){
                            HStack{
                                Text("Diet preference : ")
                                Spacer()
                                Text("\(userdata.user.dietPreference.rawValue)")
                                
                            }
                            .onTapGesture {
                                withAnimation(.easeIn(duration: 0.5)){
                                    isPickerPresented = true
                                }
                            }
                            if isPickerPresented{
                                Picker("", selection: $userdata.user.dietPreference){
                                    ForEach(DietPrefrence.allCases ,id: \.self){diet in
                                        Text(diet.rawValue)
                                    }
                                }.pickerStyle(.segmented)
                                    .background(.yellow)
                            }
                            NavigationLink(destination: changeHealthProblem(userdata: userdata), label: {
                                Text("Your health problems")
                            })
                            
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .background(.yellow)
                    .tint(.yellow)
                    .navigationTitle("\(userdata.user.name)")
                    
                    .toolbar{
                        ToolbarItem(placement: .topBarTrailing, content: {
                            if (isDatePresented || isPickerPresented){
                                Button("Done"){
                                    withAnimation(.easeInOut(duration: 0.8)){
                                        isDatePresented = false
                                    }
                                   
                                    isPickerPresented = false
                                }
                            }
                        })
                }
                }
            }
            .preferredColorScheme(.light)
        }
        .onAppear{
            viewModel.addNewData(UUID: "\(userdata.user.id)")
        }
        
        
        
        
    }
}
private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }

#Preview {
    Account_View()
}
