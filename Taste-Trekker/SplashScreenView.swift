//
//  SplashScreenView.swift
//  Taste-Trekker
//
//  Created by Shomil Singh on 20/12/23.
//

import SwiftUI

struct SplashScreenView: View {
    @Binding var page : Int
    
    let dullWhite = Color(red: 0.95, green: 0.95, blue: 0.95)
    @State private var isActive = false
    @State private var scaleEffect = 1.0
    @State private var opacity = 1.0
    @State private var animationAmount = 0.0
    @State private var rotation = false
    @State private var textOpacity = 1.0
    @State private var startup = true
    @ObservedObject var userdata = UserData()
    var view : some View{
        NavigationStack{
//            if let page = page{
//            print(page)
            switch page{
            case 1:
                AnyView(onBoardingScreenView(page: $page,userdata: userdata).navigationBarBackButtonHidden(true))
            case 2:
                AnyView(onBoardingScreenView2(healthIssue: [""], page: $page, userdata: userdata, dietType: .Vegetarian).navigationBarBackButtonHidden(true))
            default:
                AnyView(ContentView(userdata: userdata).navigationBarBackButtonHidden(true))
            }
//        }
        }
//        else{
//            print("-1")
//            if(pageNumber == nil){
//                print("no value")
//            }
//            return AnyView(ContentView())
//        }
    }
    
    
    var body: some View {
        if(isActive){
            NavigationStack{
                withAnimation{
                    Button(""){
                        
                    }
                    .labelsHidden()
                    .navigationDestination(isPresented: $isActive) {
                        
                      AnyView(view)
                        }
                    }
                    
                }

            }
            
            
        
        else
        {
            
            if(page == 1 || startup) {
                ZStack {
                dullWhite
                    .ignoresSafeArea()
    //                .opacity(0.85)
                
                VStack {
                    Image(systemName: "fork.knife.circle.fill")
                        .font(.system(size: 120))
                        .foregroundColor(.yellow)
                    Text("Taste Trekker")
                        .font(Font.custom("Baskerville-Bold", size: 40))
                        .foregroundStyle(.yellow)
                        .opacity(textOpacity)
                }
                .scaleEffect(scaleEffect)
                .opacity(opacity)
                .onAppear{
                    withAnimation( .easeInOut(duration: 1.0)) {
                        scaleEffect = 0.8
                        opacity = 0.85
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                        withAnimation(.easeOut(duration: 1.2)){
                            scaleEffect = 3
                            textOpacity = 0.0
                            
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                        withAnimation(.interpolatingSpring(stiffness: 50, damping: 100)){
                            animationAmount += 360
                            rotation = true
                        }
                    }
                }
                .rotation3DEffect(Angle(degrees: (rotation) ? animationAmount : 0), axis: (x:0 , y: 0.5 , z: 0))
                
                
            }.onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.21){
                        isActive = true
                        startup = false
                    }
            }
                
            }
            else{
                
                Button(""){
                    
                }
                .labelsHidden()
                .onAppear{
                    print("in else")
                    isActive = true
                }
            }
        }
    }
//    var view: some View {
//        if let page = page{
//            print(page)
//            switch page {
//            case 1:
//                return AnyView(onBoardingScreenView().navigationBarBackButtonHidden(true))
//            case 2:
//                return AnyView(onBoardingScreenView2(healthIssue: [""], dietType: .Vegetarian).navigationBarBackButtonHidden(true))
//            default:
//                return AnyView(ContentView().navigationBarBackButtonHidden(true))
//            }
//        }
//        else
//        {
//            return AnyView(ContentView().navigationBarBackButtonHidden(true))
//        }
//        }
}

#Preview {
    SplashScreenView(page: .constant(1))
}
