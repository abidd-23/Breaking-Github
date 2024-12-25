//
//  model.swift
//  weather-app
//
//  Created by Abid Ali    on 12/25/24.
//
import Foundation

struct GitHubUser: Codable {
    let login: String
    let avatarUrl : String
    let bio : String?
}

enum GHError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
