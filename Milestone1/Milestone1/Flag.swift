//
//  Flag.swift
//  Milestone1
//
//  Created by Christian James Welly on 2/12/20.
//

import Foundation

class Flag {
    static var map: [String: String] =
        ["spain": "Spain",
         "nigeria": "Nigeria",
         "ireland": "Ireland",
         "germany": "Germany",
         "italy": "Italy",
         "poland": "Poland",
         "russia": "Russia",
         "estonia": "Estonia",
         "monaco": "Monaco",
         "france": "France",
         "us": "US",
         "uk": "UK"]
    
    static func getLowercaseFlag(flagPath: String) -> String {
        // Assume that filename will have '@'
        let exclusiveIdx = flagPath.firstIndex(of: "@") ?? flagPath.endIndex
        let lowercaseFlag: String = String(flagPath[..<exclusiveIdx])
        return lowercaseFlag
    }
    
    static func capitalise(flagPath: String) -> String {
        let lowercaseFlag = getLowercaseFlag(flagPath: flagPath)
        return capitalise(lowercaseFlag: lowercaseFlag)
    }
    
    static func capitalise(lowercaseFlag: String) -> String {
        if let capitalised = map[lowercaseFlag] {
            return capitalised
        }
        fatalError("Trying to capitalise an unknown flag: \(lowercaseFlag)")
    }
}
