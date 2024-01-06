//
//  changeWeight.swift
//  Taste-Trekker
//
//  Created by Shomil Singh on 25/12/23.
//

import SwiftUI

struct changeWeight: View {
    @ObservedObject var userdata = UserData()
    @State var weight = ""
    var body: some View {
        NavigationStack{
            ZStack {
                Color(.yellow)
                    .ignoresSafeArea()
                Form {
                    HStack{
                        Text("Weight : ")
                        Spacer()
                        TextField("Your weight",text: $weight)
    //                        .onSubmit {
    //                            userdata.user.weight=Double(weight) ?? 0.0
    //                        }
                            .onChange(of: weight){
                                newvalue in
                                userdata.user.weight = Double(newvalue) ?? 0.0
                            }
                            .frame(width: 100)
                        
                    
                    }
                }
                .scrollContentBackground(.hidden)
                .background(.yellow)
                .tint(.yellow)
            }
        }
        
    }
}

#Preview {
    changeWeight()
}
