//
//
//  SearchMovieResponse.swift
//  MovieDB
//
//  Created by Muhammed Elsayed on 4/18/20.
//  Copyright © 2020 Muhammed Elsayed. All rights reserved.
//
import Foundation

struct MovieResults: Codable {
    
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
}
