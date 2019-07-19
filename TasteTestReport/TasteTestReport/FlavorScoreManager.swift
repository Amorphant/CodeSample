//
//  FlavorScoreManager.swift
//  TasteTestReport
//
//  Created by David Artman on 7/14/19.
//  Copyright © 2019 LaCroix. All rights reserved.
//

import Foundation


class FlavorScoreManager {
    
    var fullPathName: String
    var sourceData: [String]

    init(fullPathName: String) {
        self.fullPathName = fullPathName
        
        do {
            let sourceFileData = try String(contentsOfFile: fullPathName, encoding: .utf8)
            self.sourceData = sourceFileData.components(separatedBy: .newlines)
        } catch {
            print(error)
            self.sourceData = []
        }
    }

    func output() -> [(key: String, value: Int)] {
        var results: [String:Int] = [:]
        
        for line: String in sourceData {
            if line.count > 0 {
                let vote: TasterVote = TasterVote(line)
                
                if let currentScore = results[vote.flavor] {
                    results[vote.flavor] = currentScore + vote.score
                }
                else {
                    results[vote.flavor] = vote.score
                }
            }
        }

        return results.sorted {
            $0.1 != $1.1 ? $0.1 > $1.1 : $0.0.count < $1.0.count
        }
    }
    
    func printResults() {
        var lineNumber: Int = 1
        for result in output() {
            let isPlural: Bool = result.value != 1
            print("\(lineNumber). \(result.key), \(result.value) pt\(isPlural ? "s" : "")")
            lineNumber += 1
        }
    }
}
