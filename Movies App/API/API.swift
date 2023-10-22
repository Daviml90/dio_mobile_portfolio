//
//  API.swift
//  Movies
//
//  Created by Davi Martinelli de Lira on 10/18/23.
//

import Foundation

struct MoviesResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int
    let title: String
    let overview: String
    let release_date: String
}

