//
//  TasterVote.swift
//  TasteTestReport
//
//  Created by David Artman on 7/14/19.
//  Copyright © 2019 David Artman. All rights reserved.
//

import Foundation


let scoresByRank: [Int] = [5, 3, 2, 1]


struct TasterVote {
    
    var flavor: String
    var rank: Int
    var score: Int {
        get {
            if (1...scoresByRank.count).contains(rank) {
                return scoresByRank[rank - 1]
            }
            else {
                return 0
            }
        }
    }
    
    init(_ sourceLine: String) {
        var lineComponents: [String] = sourceLine.components(separatedBy: .whitespaces)
        if lineComponents.count >= 2,
            let lastComponent: String = lineComponents.last,
            let rank: Int = Int(lastComponent) {
            lineComponents.removeLast()
            
            self.flavor = lineComponents.joined(separator: " ")
            self.rank = rank
        }
        else {
            self.flavor = ""
            self.rank = 0
        }
    }
}
