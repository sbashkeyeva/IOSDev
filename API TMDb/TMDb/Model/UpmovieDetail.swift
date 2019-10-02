//
//  UpmovieDetail.swift
//  TMDb
//
//  Created by Symbat Bashkeyeva on 7/4/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation

class UpmovieDetail : Codable {
    let id: Int
    let title: String
    let posterPath: String
    let overview: String
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
        case overview
    }
    
}
