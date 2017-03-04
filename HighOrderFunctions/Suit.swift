//
//  Suit.swift
//  HighOrderFunctions
//
//  Created by Jim Campagno on 3/4/17.
//  Copyright © 2017 Jim Campagno. All rights reserved.
//

import Foundation


enum Suit: String, CustomStringConvertible {
    
    static let all: [Suit] = [.diamonds, .hearts, .spades, .clubs]
    
    case diamonds, hearts, spades, clubs
    
    var description: String {
        return rawValue.capitalized
    }
    
}
