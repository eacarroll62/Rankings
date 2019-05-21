//
//  MasseyData.swift
//  Rankings
//
//  Created by Eric Carroll on 5/6/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import Foundation

struct Statistics : Codable {
    let DaysFromYearZero: Int
    let DatePlayed: String
    let Team1ID: Int
    let Team1Ad: Int
    let Team1Score: Int
    let Team2ID: Int
    let Team2Ad: Int
    let Team2Score: Int
    
}
