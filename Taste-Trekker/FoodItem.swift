//
//  FoodItem.swift
//  Taste-Trekker
//
//  Created by Shomil Singh on 19/12/23.
//

import Foundation
struct FoodItem : Identifiable , Codable{
    var id = UUID()
    var name : String
}
