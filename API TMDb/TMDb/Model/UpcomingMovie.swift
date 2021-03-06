//
//  UpcomingMovie.swift
//  TMDb
//
//  Created by Symbat Bashkeyeva on 6/26/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation

class UpcomingContainer: Codable {
    let results: [UpcomingMovie]
}

class UpcomingMovie: Codable {
    let posterPath: String?
    let id: Int
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case id
    }
}

