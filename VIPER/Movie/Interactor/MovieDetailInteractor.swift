//
//  MovieDetailInteractor.swift
//  VIPER
//
//  Created by ITAU on 28-06-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import iOSMovieDB

class MovieDetailInteractor: InteractorMovieDetailProtocol {

    var presenter: PresenterMovieDetailProtocol?
    var provider: MovieProvider?

    init(provider: MovieProvider?){
       self.provider = provider
    }

    func fetchDetail(id: Int) {
        self.provider?.getMovie(id: id) { result in
            switch result {
            case .success(let movie):
                self.presenter?.successFetchDetails(movie: movie)
            case .failure(let error):
                debugPrint(error)
                self.presenter?.errorFetchDetails(error: error)
            }
        }
    }
}
