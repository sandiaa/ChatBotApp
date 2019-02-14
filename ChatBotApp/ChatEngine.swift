//
//  ChatEngine.swift
//  ChatBotApp
//
//  Created by Admin on 07/01/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import UIKit

protocol ChatEngineDelegate:class {
    func showSuggestions(suggestions:[Chat])
    func showKeyboard(sugg: [Chat])
    func didAddNewChat()
}

enum ChatType {
    case bot
    case user
}

class ChatEngine {
    
    weak var delegate:ChatEngineDelegate?
    
    var chatHistory = [Chat]()
    var brain = ChatBrain()
    
    func startOnboarding() {
        
        if let newMessage = brain.responseMessage(index: 0) {
            let message = Chat(index: getNextIndex(), responseId: 0, chatMessage: newMessage
                , image: nil, chatType: .bot)
            chatHistory.append(message)
 
        }
        
        let newSuggestions  = getResponsesFromUser()
        if newSuggestions.count > 0 {
            delegate?.showSuggestions(suggestions: newSuggestions)
        }
        
    }
    func askQuestionToUser() {
        if let newMessage = brain.responseMessage(index: getResponseId()) {
            let message = Chat(index: getNextIndex(), responseId: getResponseId(), chatMessage: newMessage
                , image: nil, chatType: .bot)
            chatHistory.append(message)
            delegate?.didAddNewChat()
        }
        
        let newSuggestions  = getResponsesFromUser()
        if newSuggestions[0].chatMessage == "" {
            delegate?.showKeyboard(sugg: newSuggestions)
        }
        
        else if newSuggestions[0].chatMessage != ""  {
            delegate?.showSuggestions(suggestions: newSuggestions)
        }
     
    }
    
    
    func getNextIndex()->Int {
        if let lastChat = chatHistory.last {
            return lastChat.index+1
        }
        else {
            return 0
        }
    }
    func getResponseId()->Int {
        if let response = chatHistory.last?.responseId {
            return response
        }
        else {
            return 0
        }
    }
    
    func getResponsesFromUser()->[Chat] {
        var suggestionMessage = [Chat]()
      
        //if
            let count = brain.suggestionMessage(index: getResponseId())
       // let c = brain.suggestionMessage(index: getResponseId())
        for (key,value) in count! {
                suggestionMessage.append(Chat(index: getNextIndex(), responseId: key, chatMessage: value, image: nil, chatType: .user))
            }
            return suggestionMessage
    }
    
    func newSuggestionSelected(suggestion:Chat) {
        chatHistory.append(suggestion)
        delegate?.didAddNewChat()
    }
    
    func userEnteredText(chat1 : Chat){
   
        chatHistory.append(chat1)
        
        delegate?.didAddNewChat()
        askQuestionToUser()
    }
}


struct Chat {
    let index:Int
    let responseId : Int
    var chatMessage:String?
    let image:UIImage?
    let chatType:ChatType
   // let keyboardInfo:KeyBoardInfo?
}

//struct KeyBoardInfo {
//    var keyboardType:UIKeyboardType = .default
//
//}
extension ChatEngine : ChatBrainDelegate {
    func getLastIndex() -> String? {
        let newIndexPath = chatHistory.count-1
        let messageId = chatHistory[newIndexPath]
        print(messageId)
        return messageId.chatMessage
    }
    

  
    
}
