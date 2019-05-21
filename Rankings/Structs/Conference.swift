//
//  Conference.swift
//  Rankings
//
//  Created by Eric Carroll on 5/8/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import Foundation

struct Conference: Codable, Hashable {
    let ID: Int
    let School: String
    let Nickname: String
    let City: String
    let State: String
    let Region: String
    let Conference: String
    let Division: String
}
