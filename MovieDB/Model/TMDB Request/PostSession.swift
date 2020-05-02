//
//  PostSession.swift
//  MovieDB
//
//  Created by Muhammed Elsayed on 4/17/20.
//  Copyright © 2020 Muhammed Elsayed. All rights reserved.
//

import Foundation
struct PostSession: Codable {
    
    let requestToken: String
    
    enum CodingKeys: String, CodingKey {
        case requestToken = "request_token"
    }
    
}
