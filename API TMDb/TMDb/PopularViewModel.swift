//
//  PopularViewModel.swift
//  TMDb
//
//  Created by Symbat Bashkeyeva on 6/25/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation
import  UIKit
class PopularViewModel: PopularViewModelProtocol {
    
    weak var delegate: PopularViewModelDelegate?
    
    func fetchPopularMovies(by page: Int) {
//        var parak: Int = page
        var popularMovies = [PopularMovie]()
//        parak += 1
        let popularMoviesRequestData = PopularMoviesRequestData(parameters: ["page":String(page)])
        let networkAdapter = NetworkAdapter(session: session)
        _ = networkAdapter.perform(request: popularMoviesRequestData.urlRequest) { [weak self] result in
            switch result {
            case .success(let object):
//                print("success")
                let list: MovieContainer = convert(object: object)
//                print("list \(list)")
                for item in list.results {
                    popularMovies.append(item)
//                    print(i.poster_path)
//                     print(i)
                }
                
//                print("parak", parak)
                self?.delegate?.performOnFetch(movies: popularMovies )
            case .failure(let error):
//                print("failure")
                self?.delegate?.performOnError(error)
            }
        }
    }
}
