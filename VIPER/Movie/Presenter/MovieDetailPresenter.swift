//
//  MovieDetailPresenter.swift
//  VIPER
//
//  Created by ITAU on 28-06-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import iOSMovieDB

class MovieDetailPresenter: PresenterMovieDetailProtocol {

    var mainView: ViewMovieDetailProtocol?
    var interactor: InteractorMovieDetailProtocol?

    func fetchDetails(from idMovie: Int) {
        self.interactor?.fetchDetail(id: idMovie)
    }

    func successFetchDetails(movie: Movie) {
        self.mainView?.showDetail(from: movie)
    }

    func errorFetchDetails(error: Error) {
        self.mainView?.errorFetchDetails(error: error)
    }

}
