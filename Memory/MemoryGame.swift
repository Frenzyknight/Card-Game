//
//  MemoryGame.swift
//  Memory
//
//  Created by Gaurav Ganju on 31/10/21.
//

import Foundation

struct MemoryGame<CardContent> {                                        // <CardContent> is of "don't care" (generic) type and is declared here
    private(set) var cards: Array<Card>
    
    mutating func choose(_ card: Card) {                                         // We use "_" as an external name which will be 'blank' whereas "card" is the internal name
        let chosenIndex = index(of : card)
        cards[chosenIndex].isFaceUp.toggle()
        print("\(cards)")
    }
    
    func index(of card: Card) -> Int {                                  //'of' and 'card' are internal and external names respectively
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairOfCards * 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
    }
    
    struct Card: Identifiable{
        var id: Int // Struct inside struct full name is MemoryGame.Card for outside the scope
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
