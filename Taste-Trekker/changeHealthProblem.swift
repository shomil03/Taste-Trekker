//
//  changeHealthProblem.swift
//  Taste-Trekker
//
//  Created by Shomil Singh on 26/12/23.
//

import SwiftUI

struct changeHealthProblem: View {
    @StateObject var userdata = UserData()
    var body: some View {
        NavigationStack{
            ZStack {
                Color(.yellow)
                    .ignoresSafeArea()
                VStack {
                    Text("Your health problems :")
                        .font(Font.custom("ChalkboardSE-Regular", size: 28))
                        .padding()
                    
                    List{
                        ForEach(0 ..< userdata.user.healthProblem.count , id: \.self){problems in
                            TextField("Specify health issue", text: $userdata.user.healthProblem[problems])
                            
                        }
                        .onDelete(perform: removeItems
                        )
                        
                        Button(action: {
                            userdata.user.healthProblem.append("")
                        }) {
                            Label("Add health problem", systemImage: "plus.circle")
                        }

                    }
                    .scrollContentBackground(.hidden)
                    .background(.yellow)
                .tint(.yellow)
                }
                
                
            }
        }
    }
    func removeItems(atOffset : IndexSet)
    {
        userdata.user.healthProblem.remove(atOffsets: atOffset)
    }
}

#Preview {
    changeHealthProblem()
}
