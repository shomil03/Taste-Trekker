//
//  ViewModel.swift
//  Taste-Trekker
//
//  Created by Shomil Singh on 26/12/23.
//

import Foundation
import SwiftUI
struct EndPoint{
    static let registerUser = "https://demonkillerh.pythonanywhere.com/recommendDish"
    
}

struct ResponseData{
    var SpicyLevel : Int
    var HungerLevel : Int
    func registerUser(){
        @ObservedObject var userdata = UserData()
        
        let Ingredients : [String] = [""]
        var urlRequest = URLRequest(url: URL(string: EndPoint.registerUser)!)
        urlRequest.httpMethod = "post"
        let dataDictionary = ["UserId" : "\(userdata.user.id)" , "SpicyLevel" : SpicyLevel, "HungerLevel" : HungerLevel , "Ingredients" : Ingredients ] as [String : Any]
        
        do{
            let requestBody = try JSONSerialization.data(withJSONObject: dataDictionary , options: .prettyPrinted)
            urlRequest.httpBody = requestBody
            urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
            if let jsonString = String(data: requestBody, encoding: .utf8) {
                            print("Request Body:\n\(jsonString)")
                        }
        }
        catch let error{
            print(error.localizedDescription)
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, HTTPURLResponse, error in
            if ( data != nil && data?.count != 0)
            {
                let response = String(data: data!, encoding: .utf8)
                print("response = ",response!)
            }
        }.resume()
        
    }
    
}
