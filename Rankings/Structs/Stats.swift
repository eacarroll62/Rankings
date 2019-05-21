//
//  Stats.swift
//  Rankings
//
//  Created by Eric Carroll on 5/7/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import Foundation

struct Stats {
    var result: [Statistics]
    
    func getNumberOfGames(win: Bool, position: Int, locale: Int) -> Int {
        if locale < 2 {
            if win == true {
                return result.filter {$0.Team1ID == position + 1 && $0.Team1Ad == locale}.count
            } else {
                return result.filter {$0.Team2ID == position + 1 && $0.Team2Ad == locale}.count
            }
        } else {
            if win {
                return result.filter {$0.Team1ID == position + 1}.count
            } else {
                return result.filter {$0.Team2ID == position + 1}.count
            }
        }
    }
    
    func getNumberOfPoints(win: Bool, position: Int, locale: Int) -> Int {
        if locale < 2 {
            if win == true {
                return result.filter {$0.Team1ID == position + 1 && $0.Team1Ad == locale}.map {$0.Team1Score}.reduce(0, +) // PF Win
            } else {
                return result.filter {$0.Team2ID == position + 1 && $0.Team2Ad == locale}.map {$0.Team2Score}.reduce(0, +) // PF Loss
            }
        } else {
            if win {
                return result.filter {$0.Team1ID == position + 1}.map {$0.Team1Score}.reduce(0, +)
            } else {
                return result.filter {$0.Team2ID == position + 1}.map {$0.Team2Score}.reduce(0, +)
            }
        }
    }
}


