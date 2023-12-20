//
//  SplashScreenView.swift
//  Taste-Trekker
//
//  Created by Shomil Singh on 20/12/23.
//

import SwiftUI

struct SplashScreenView: View {
    let dullWhite = Color(red: 0.95, green: 0.95, blue: 0.95)
    @State private var isActive = false
    @State private var scaleEffect = 1.0
    @State private var opacity = 1.0
    @State private var animationAmount = 0.0
    @State private var rotation = false
    @State private var textOpacity = 1.0
    var body: some View {
        if(isActive){
            withAnimation{
                ContentView()
            }
            
        }
        else
        {
        
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
                withAnimation(.easeInOut(duration: 1.0)) {
                    scaleEffect = 0.8
                    opacity = 0.85
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                    withAnimation(.easeOut(duration: 1.2)){
                        scaleEffect = 3
//                        opacity = 1.0
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
            
            
        }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.21){
                    isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
