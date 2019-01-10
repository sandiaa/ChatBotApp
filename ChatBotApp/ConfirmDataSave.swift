//
//  ConfirmDataSave.swift
//  ChatBotApp
//
//  Created by Admin on 08/01/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import UIKit

class ConfirmDataSave {
    
    let login = Login()
    let signup = SignUp()
    
    func checkName(name : String?) -> String? {
        guard let name = name else {return nil }
        let  str = signup.validateNameSignup(name: name)
        if str {
            return "enter your email"
        }
        else {
            return "enter your name without any special characters"
        }
        
   
    }
    func signupNameSuggestion(name : String?) -> [Int : String] {
        guard let name = name else {return [:]}
        let  str = signup.validateNameSignup(name: name)
        if str {
            return [5 : ""] }
        else {
            return [4 : ""]
        }
    }
    func checkEmailSignup(email : String? ) -> String? {
         guard let email = email else {return nil }
        let  str = signup.validateEmailSignup(email: email)
        if str {
            return "enter password"
        }
        else {
            return "enter your email one more time "
        }
        
        
    }
    func signupEmailSuggestion(email : String?) -> [Int : String] {
        guard let email = email else {return [:] }
        let  str = signup.validateEmailSignup(email: email)
        if str {
            return [6 : ""] }
        else {
            return [5 : ""]
        }
    }
    func didSignupCheck (password : String?) -> String? {
         guard let password = password else {return nil }
        let str = signup.didSignup(name: "nameValidated", email: "emailValidated", password: password)
        if str {
            return "thankyou" }
        else {
            return "enter your details one more time"
        }
    }
    
    func signupPasswordSuggestion(password : String?) -> [Int : String] {
        guard let password = password else {return [:] }
        let str = signup.didSignup(name: "nameValidated", email: "emailValidated", password: password)
        if str {
            return [7 : ""] }
        else {
            return [6 : ""]
        }
    }
    
    func checkEmailSignin(email : String? ) -> String? {
         guard let email = email else {return nil }
        let str = login.validateEmailSignin(email: email)
        if str {
            return "enter password"
        }
        else {
            return "enter your email one more time "
        }
        
        
    }
    func signinEmailSuggestion(email : String?) -> [Int : String] {
        guard let email = email else {return [:] }
        let str = login.validateEmailSignin(email: email)
        if str {
            return [10 : ""] }
        else {
            return [11 : ""]
        }
    }
    func didSigninCheck (password : String?) -> String? {
         guard let password = password else {return nil }
        let str = login.didLogin(email: "emailValidated", password: password)
        if str {
            return "thankyou" }
        else {
            return "enter your details one more time"
        }
    }
    
    func signinPasswordSuggestion(password : String?) -> [Int : String] {
        guard let password = password else {return [:] }
        let str = login.didLogin(email: "emailValidated", password : password)
        if str {
            return [12 : ""] }
        else {
            return [11 : ""]
        }
    }
   
}
