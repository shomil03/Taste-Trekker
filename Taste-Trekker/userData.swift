//
//  userData.swift
//  Taste-Trekker
//
//  Created by Shomil Singh on 22/12/23.
//

import Foundation

class UserData : ObservableObject{
    @Published var user : User{
        didSet{
            if let encoded = try? JSONEncoder().encode(user){
                UserDefaults.standard.set(encoded, forKey: "UserData")
            }
        }
    }
    init() {
        if let saveData = UserDefaults.standard.data(forKey: "UserData") {
            if let decoder = try? JSONDecoder().decode(User.self, from: saveData){
                user = decoder
                return
            }
        }
        user = User()
    }
    func updateUserData(name: String, weight: String, height: String, DOB: Date) {
            user.name = name
        user.weight = Double(weight) ?? 0.0
        user.height = Double(height) ?? 0.0
            user.DOB = DOB

            // Assuming you have more properties in your User struct, update them as well.
            // For example, you might want to update the diet preference and health problems.

            // Notify observers that the user data has been updated.
            objectWillChange.send()
        }
    func updateDiet(dietType : DietPrefrence , healthIssues : [String]){
        user.dietPreference = dietType
        user.healthProblem = healthIssues
        objectWillChange.send()
    }
    func printData() {
        print(user.name)
    }
    }
