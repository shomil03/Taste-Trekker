//
//  Taste_TrekkerApp.swift
//  Taste-Trekker
//
//  Created by Shomil Singh on 11/12/23.
//

import SwiftUI
import FirebaseCore
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


@main
struct Taste_TrekkerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @AppStorage("pageNumber", store: .standard) var page : Int = 1
    var body: some Scene {
        WindowGroup {
            SplashScreenView(page: $page)
//            HomeView()
//            onBoardingScreenView2(healthIssue: [""], page: $page, dietType: .Vegetarian)
        }
    }
}
