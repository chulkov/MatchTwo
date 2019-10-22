//
//  Card.swift
//  MatchTwo
//
//  Created by Max on 21/10/2019.
//

import Foundation

struct Card{
    
    var isFaceUp = false
    var isMatched = false
    var cardId: Int
    
    static var cardIdFactory = 0
    
    static func getUniqueId() -> Int{
        cardIdFactory += 1
        return cardIdFactory
    }
    
    init(){
        self.cardId = Card.getUniqueId()
    }
    
}
