//
//  main.swift
//  TasteTestReport
//
//  Created by David Artman on 7/14/19.
//  Copyright © 2019 David Artman. All rights reserved.
//

import Foundation


let defaultPathName: String = "./sample-input.txt"

let commandLineArguments = CommandLine.arguments
let fullPathName = commandLineArguments.count > 1 ? commandLineArguments[1] : defaultPathName

let flavorScoreManager = FlavorScoreManager(fullPathName: fullPathName)
flavorScoreManager.printResults()
