//
//  PresenterMovies.swift
//  VIPER
//
//  Created by ITAU on 28-06-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import iOSMovieDB

class PresenterMovies: PresenterMoviesProtocol {

    var router: RouterMoviesInput?
    weak var mainView: ViewMoviesProtocol?
    var interactor: InteractorMoviesProtocol?

    func fetchMovies() {
        interactor?.fetchMovies()
    }

    func successFetchMovies(movies: [MovieResume]) {
        mainView?.showMovies()
    }

    func failureFetchMovies(error: Error) {
        mainView?.errorMovies()
    }

    func selectMovie(index: IndexPath) {
        if let movieResumen = interactor?.getMovie(row: index.row) {
            router?.goToDetailMovie(movie: movieResumen)
        }
    }

}
