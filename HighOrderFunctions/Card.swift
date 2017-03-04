//
//  Card.swift
//  HighOrderFunctions
//
//  Created by Jim Campagno on 3/4/17.
//  Copyright © 2017 Jim Campagno. All rights reserved.
//

import Foundation
import UIKit
import GameKit

protocol PlayingCard {
    var rank: Rank { get }
    var suit: Suit { get }
}


final class Card: PlayingCard {
    
    let rank: Rank
    let suit: Suit
    let image: UIImage
    var isFaceUp: Bool = true
    var value: Int {
        return rank.value
    }
    
    init(rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
        let imageName = rank.description + suit.description
        image = UIImage(named: imageName)!
    }
    
    func flipCard() {
        isFaceUp = !isFaceUp
    }
    
}

extension Card: CustomStringConvertible {
    
    var description: String {
        var suitString: String
        switch suit {
        case.clubs:
            suitString = "♣️"
        case .spades:
            suitString = "♠️"
        case .diamonds:
            suitString = "♦️"
        case .hearts:
            suitString = "♥️"
        }
        return suitString + rank.description
    }
    
}

// MARK: - Sort Methods
extension Array where Element: PlayingCard {
    
    mutating func sortCards() {
        // TODO: Use the sorted function to properly sort how the cards should line up within self (self being an instance of an Array). A call to the sorted function will return back to you a new Array. You should assign what is returned to you by sorted to self.
    }
    
    mutating func shuffle() {
        self = GKRandomSource().arrayByShufflingObjects(in: self) as! Array<Iterator.Element>
    }
    
}
