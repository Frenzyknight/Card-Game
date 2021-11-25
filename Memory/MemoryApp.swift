//
//  MemoryApp.swift
//  Memory
//
//  Created by Gaurav Ganju on 05/10/21.
//

import SwiftUI

 @main
struct MemoryApp: App {
    let game = EmojiMemoryGame( )
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
