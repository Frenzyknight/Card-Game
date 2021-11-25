//
//  EmojiMemoryGame.swift
//  Memory
//
//  Created by Gaurav Ganju on 01/11/21.
//

import SwiftUI                                      // We have to import SwiftUI because ViewModel is part of the UI
/*
 ("This code is equivalent to code in line 17")
func makeCardContent(index: Int) -> Str ing{
    return "😁"
}
*/
 

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🚂", "🚀", "🚘", "✈️", "🚑", "🚚", "🏍", "🚲", "🏎", "🚢", "🚁", "🛸", "🚔", "🛴", "🛵", "🚎", "🚟", "🚤", "🚃", "🚕", "🚍", "🛻", "🛩", "🚜"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
           emojis[pairIndex]
       }
    }
    
    
    @Published private var model: MemoryGame<String> = createMemoryGame()                //@Published basically announces whenever the model changes
    
    var cards: Array<MemoryGame<String>.Card> {
        return  model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
            model.choose(card)
    }
    
}
