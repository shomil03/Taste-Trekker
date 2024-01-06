//
//  changeHeight.swift
//  Taste-Trekker
//
//  Created by Shomil Singh on 25/12/23.
//

import SwiftUI

struct changeHeight: View {
    @ObservedObject var userdata = UserData()
    @State var height = ""
    var body: some View {
        NavigationStack{
            ZStack {
                Color(.yellow)
                    .ignoresSafeArea()
                Form {
                    HStack{
                        Text("Weight : ")
                        Spacer()
                        TextField("Your weight",text: $height)
    //                        .onSubmit {
    //                            userdata.user.weight=Double(weight) ?? 0.0
    //                        }
                            .onChange(of: height){
                                newvalue in
                                userdata.user.height = Double(newvalue) ?? 0.0
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
    changeHeight()
}
