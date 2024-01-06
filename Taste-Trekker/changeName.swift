//
//  changeName.swift
//  Taste-Trekker
//
//  Created by Shomil Singh on 25/12/23.
//

import SwiftUI

struct changeName: View {
    @StateObject var userdata = UserData()
    var body: some View {
        NavigationStack{
            ZStack {
                Color(.yellow)
                    .ignoresSafeArea()
                List{
                    HStack{
                        Text("Name : ")
                            .foregroundStyle(.black)
                        Spacer()
                        TextField("Your name", text: $userdata.user.name)
                            .frame(width: 100)
                            .foregroundStyle(.black)
                        
                    }
                    
                    .foregroundStyle(Color(red: 0.95, green: 0.95, blue: 0.95))
                    
                }
                .scrollContentBackground(.hidden)
                .background(.yellow)
                .tint(.yellow)
            }
        }
    }
}

#Preview {
    changeName()
}
