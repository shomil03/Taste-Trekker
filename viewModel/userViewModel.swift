//
//  userViewModel.swift
//  Taste-Trekker
//
//  Created by Shomil Singh on 25/12/23.
//

import Foundation
import SwiftUI
import FirebaseFirestore
class userViewModel : ObservableObject{
    @Published var user = UserData()
    let db = Firestore.firestore()
    func addNewData(UUID : String){
        do{
            _ = try db.collection("Users").document("\(UUID)").setData([
                "DOB" : user.user.DOB ,
                "DietPreference" : user.user.dietPreference.rawValue ,
                "HealthProblems" : user.user.healthProblem ,
                "Height" : user.user.height ,
                "Weight" : user.user.weight ,
                "UserName" : user.user.name
            ],merge: true)
        }
        catch{
            print(error.localizedDescription)
        }
    }
//    func addNewData(UUID : String){
//        do{
//            _ = try db.collection("Users").addDocument(data: [
//                "DOB" : user.user.DOB ,
//                "DietPreference" : user.user.dietPreference.rawValue ,
//                "HealthProblems" : user.user.healthProblem ,
//                "Height" : user.user.height ,
//                "Weight" : user.user.weight ,
//                "UserName" : user.user.name
//                
//            ])
//        }
//        catch{
//            print(error.localizedDescription)
//        }
//    }
    
    
    
}
