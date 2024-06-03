//
//  Hall.swift
//  FilmHub
//
//  Created by Zakhar Litvinchuk on 20.05.2024.
//

import Foundation

struct Hall: Codable {
    let id: String
    let cinema: Cinema
    let name: String
    let numberOfSeats: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case cinema = "cinema_id"
        case name
        case numberOfSeats = "number_of_seats"
    }
}
