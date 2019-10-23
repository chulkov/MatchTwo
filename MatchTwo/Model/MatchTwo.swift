//
//  Model.swift
//  MatchTwo
//
//  Created by Max on 21/10/2019.
//

import Foundation

class MatchTwo{
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex].cardId == cards[index].cardId{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairOfCards: Int) {
        
        for _ in 1...numberOfPairOfCards{
            let card = Card()
            //cards.append(card)
            //cards.append(card)
            cards += [card, card]
        }
        //TODO: Shuffle the cards
        cards = cards.shuffled()
    }
}
