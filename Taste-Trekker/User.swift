//
//  User.swift
//  Taste-Trekker
//
//  Created by Shomil Singh on 20/12/23.
//

import Foundation
struct User : Identifiable , Codable{
    var id = UUID()
    var name : String
    var dietPreference : DietPrefrence
    var weight : Double
    var height : Double
    var healthProblem : [String]
    var DOB : Date
    
    init() {
            self.name = ""
        self.dietPreference = .Vegetarian
            self.weight = 0.0
            self.height = 0.0
            self.healthProblem = []
            self.DOB = Date()
        }
}
