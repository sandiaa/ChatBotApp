//
//  Login.swift
//  ChatSuggestion
//
//  Created by Admin on 07/01/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import UIKit


class Login {
    
    var isUser = false
    var emailValidated = false
    var didLogin = false
    var str = ""
    
    
    
    func validateEmailSignin(email : String) -> Bool {
        if emailValidated {
            return true
            
        }
        else {
            return false
        }
        
    }
    func didLogin(email :String, password : String) -> Bool {
        if didLogin {
            return true
        }
        else {
            return false
        }
    }
    
        
    
}
