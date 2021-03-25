//
//  Data.swift
//  SamWhelanAssignment1
//
//  Created by  on 3/25/21.
//

import UIKit

class Data: NSObject {

    var id: Int?
    var name: String?
    var email: String?
    var address: String?
    var phoneNumber: String?
    var age: Int?
    var gender: String?
    var date: String?
    var avatar: Int?
    
    func initWithData(theRow i: Int, theName n: String, theEmail e: String, theAddress a: String, thePhoneNumber p: String, theAge ag: Int, theGender g: String, theDate d: String, theAvatar av: Int ){
        
        id = i
        name = n
        email = e
        address = a
        phoneNumber = p
        age = ag
        gender = g
        date = d
        avatar = av
        
    }
}
