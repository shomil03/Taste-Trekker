//
//  FoodItems.swift
//  Taste-Trekker
//
//  Created by Shomil Singh on 19/12/23.
//

import Foundation
class FoodItems : ObservableObject {
    @Published var items = [FoodItem](){
        didSet{
            if let encoded = try? JSONEncoder().encode(items){
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items"){
            if let decoder = try? JSONDecoder().decode([FoodItem].self, from: savedItems){
                items = decoder
                return
            }
                
        }
        items = []
    }
    
}
