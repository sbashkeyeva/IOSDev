//
//  DetailViewModelProtocol.swift
//  TMDb
//
//  Created by Symbat Bashkeyeva on 6/28/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation

protocol DetailViewModelProtocol : class {
    var delegate: DetailViewModelDelegate? { get set }
    func fetchUpcomingDetail(by id: Int)
}
