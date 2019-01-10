//
//  ChatBrain.swift
//  ChatBotApp
//
//  Created by Admin on 07/01/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import UIKit

protocol ChatBrainDelegate : class{
    func getLastIndex()->String?
}
class ChatBrain {
     weak var delegate:ChatBrainDelegate?
    let savaData = ConfirmDataSave()
    var actionArray : [Action] {
        var arr = [Action]()
      
        
        let text = delegate?.getLastIndex()
        
        let d0 = Action(response: "Hi", suggestionArray: [1 : "hello"])
        arr.append(d0)
        let d1 = Action(response: "I am here to assist you with signup and login", suggestionArray: [2 : "ok"])
        arr.append(d1)
        let d2 = Action(response: "do you want to login or signup", suggestionArray: [3 : "lets signup", 9 : "i want to login"])
        arr.append(d2)
        let d3 = Action(response: "enter your email", suggestionArray: [4 : ""])
        arr.append(d3)
      
        let d4 = Action(response: savaData.checkName(name: text), suggestionArray: savaData.signupNameSuggestion(name: text))
        arr.append(d4)
        let d5 = Action(response: savaData.checkEmailSignup(email: text), suggestionArray: savaData.signupEmailSuggestion(email: text))
        arr.append(d5)
        let d6 = Action(response: savaData.didSignupCheck(password: text), suggestionArray: savaData.signupPasswordSuggestion(password: text))
        arr.append(d6)
        let d7 = Action(response: ":)", suggestionArray: [8 : ""])
        arr.append(d7)
        let d8 = Action(response: "I could not understand", suggestionArray: [8 : ""])
        arr.append(d8)
        let d9 = Action(response: "enter your email", suggestionArray: [9 : ""])
        arr.append(d9)
        let d10 = Action(response: savaData.checkEmailSignin(email: text), suggestionArray: savaData.signinEmailSuggestion(email: text))
        arr.append(d10)
        let d11 = Action(response: savaData.didSigninCheck(password : text), suggestionArray: savaData.signinPasswordSuggestion(password : text))
        arr.append(d11)
        let d12 = Action(response: ":)", suggestionArray: [13 : ""])
        arr.append(d12)
        let d13 = Action(response: "I could not understand", suggestionArray: [13 : ""])
        arr.append(d13)
        
        
        return arr
    }
    
    func responseBrain(index : Int) -> Action? {
        
        if actionArray.count <= index {
            return nil
        }
        
        return actionArray[index]
        
        
    }
    
    func responseMessage(index : Int ) -> String? {
        if let data = responseBrain(index: index) {
            return data.response
        }
        return nil
    }
    func suggestionCount(index : Int) -> Int? {
        guard let data = responseBrain(index: index) else {return nil}
        let totalSug = data.suggestionArray.count
        return totalSug
    }
    func suggestionMessage(index : Int) -> [Int : String]? {
        guard let data = responseBrain(index: index) else {return nil}
        return data.suggestionArray
    }
}

struct Action {
    var response : String?
    var suggestionArray : [Int : String]
}
