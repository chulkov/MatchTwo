//
//  Model.swift
//  MatchTwo
//
//  Created by Max on 21/10/2019.
//

import Foundation

class MatchTwo{
    
    private(set) var cards = [Card]()
    
    private(set) var scoreCount = 0
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get{
            var foundIndex: Int?
            for index in cards.indices{
                if cards[index].isFaceUp{
                    if foundIndex == nil{
                        foundIndex = index
                    }else{
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set(newValue){
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int){
        assert(cards.indices.contains(index), "\(index): chosen index not in the cards")
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex].cardId == cards[index].cardId{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    //mached 2
                    scoreCount = scoreCount + 3
                }
                cards[index].isFaceUp = true
                //second card is not match
                if cards[index].isMismatched || cards[matchIndex].isMismatched{
                    scoreCount -= 1
                }
                if !cards[index].isMismatched{
                    cards[index].isMismatched = true
                }else if !cards[matchIndex].isMismatched{
                    cards[matchIndex].isMismatched = true
                }
                
                
            }else{
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairOfCards: Int) {
        assert(numberOfPairOfCards > 0, "\(numberOfPairOfCards): you must have at least 1 pair of cards")
        for _ in 1...numberOfPairOfCards{
            let card = Card()
            //cards.append(card)
            //cards.append(card)
            cards += [card, card]
        }
        cards = cards.shuffled()
    }
}
