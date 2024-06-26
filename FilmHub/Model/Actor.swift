//
//  Actor.swift
//  FilmHub
//
//  Created by Zakhar Litvinchuk on 20.05.2024.
//

import Foundation


struct Actor: Codable {
    let id: String
    let name: String
    let popularMovies: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case popularMovies = "popular_movies"
    }
}

struct ActorMovie {
    let actor: Actor
    let movie: Movie
}
