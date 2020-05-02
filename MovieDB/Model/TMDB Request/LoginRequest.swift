//
//  LoginRequest.swift
//  MovieDB
//
//  Created by Muhammed Elsayed on 4/17/20.
//  Copyright © 2020 Muhammed Elsayed. All rights reserved.
//

import Foundation
struct LoginRequest: Codable {
    
    let username: String
    let password: String
    let requestToken: String
    
    enum CodingKeys: String, CodingKey {
        case username
        case password
        case requestToken = "request_token"
    }
}
