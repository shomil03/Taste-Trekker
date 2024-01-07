//
//  ViewModel.swift
//  Taste-Trekker
//
//  Created by Shomil Singh on 26/12/23.
//

import Foundation
import SwiftUI
import Combine
struct EndPoint{
    static let registerUser = "https://demonkillerh.pythonanywhere.com/recommendDish"
    
}

class UserViewModel: ObservableObject {

    @Published var isLoading : Bool = false
    @Published var FoodResponse : food?
    private var cancellables: Set<AnyCancellable> = []
    
    func registerUser(SpicyLevel : Int , HungerLevel : Int){
//        let userdata = UserData()
        
        let ingredients: [String] = [""]
        @ObservedObject var userdata = UserData()
        
        let Ingredients : [String] = [""]
        isLoading = true
        var urlRequest = URLRequest(url: URL(string: EndPoint.registerUser)!)
        urlRequest.httpMethod = "post"
        let dataDictionary = ["UserId" : "\(userdata.user.id)" ,
                              "SpicyLevel" : SpicyLevel,
                              "HungerLevel" : HungerLevel ,
                              "Ingredients" : Ingredients ] as [String : Any]
        
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
        URLSession.shared.dataTaskPublisher(for: urlRequest)
                   .map(\.data)
                   .decode(type: food.self, decoder: JSONDecoder())
                   .receive(on: DispatchQueue.main)
                   .sink { completion in
                       self.isLoading = false
                       switch completion {
                       case .finished:
                           break
                       case .failure(let error):
                           print("Error: \(error)")
                           
                       }
                   } receiveValue: { decodedResponse in
                       
                       self.FoodResponse = decodedResponse
                      
                   }
                   .store(in: &cancellables)
        
    }
    
}
