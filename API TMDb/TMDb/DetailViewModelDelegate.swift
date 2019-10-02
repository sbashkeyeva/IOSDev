//
//  DetailViewModelDelegate.swift
//  TMDb
//
//  Created by Symbat Bashkeyeva on 6/28/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation

protocol DetailViewModelDelegate {
    func performOnFetch(upmovies: [UpmovieDetail])
    func performOnError(_ error : Error)
}
