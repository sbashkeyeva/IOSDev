//
//  DetailViewModel.swift
//  TMDb
//
//  Created by Symbat Bashkeyeva on 6/28/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation

class DetailViewModel :DetailViewModelProtocol {
    var delegate: DetailViewModelDelegate?
    
    func fetchUpcomingDetail(by id: Int) {
        var upmovieDetail = [UpmovieDetail]()
        let upmovieRequestData = MovieRequestData(movieId: id, parameters: [:])
        let networkAdapter = NetworkAdapter(session: session)
        _ = networkAdapter.perform(request: upmovieRequestData.urlRequest, completion: {
            [weak self] result in
            switch result {
            case .success(let object):
                print(object)
                let upmovie:UpmovieDetail = convert(object: object)
                upmovieDetail.append(upmovie)
                self?.delegate?.performOnFetch(upmovies: upmovieDetail)
            case .failure(let error):
                print(error)
                self?.delegate?.performOnError(error)
                
            }
        })
    }
    
    
}
