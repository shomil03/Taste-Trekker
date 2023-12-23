//
//  Taste_TrekkerApp.swift
//  Taste-Trekker
//
//  Created by Shomil Singh on 11/12/23.
//

import SwiftUI


@main
struct Taste_TrekkerApp: App {
    @AppStorage("pageNumber", store: .standard) var page : Int = 1
    var body: some Scene {
        WindowGroup {
//            SplashScreenView(page: $page)
            onBoardingScreenView2(healthIssue: [""], page: $page, dietType: .Vegetarian)
        }
    }
}
