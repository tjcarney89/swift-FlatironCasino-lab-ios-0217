//
//  Rank.swift
//  HighOrderFunctions
//
//  Created by Jim Campagno on 3/4/17.
//  Copyright © 2017 Jim Campagno. All rights reserved.
//

import Foundation


enum Rank: Int {
    
    static let all: [Rank] = [.two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king, .ace]
    
    case two = 2, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king, ace
    
    var value: Int {
        switch self {
        case .jack, .queen, .king:
            return 10
        case .ace:
            return 11
        default:
            return rawValue
        }
    }
    
    var description: String {
        return String(describing: self).capitalized
    }
    
}
