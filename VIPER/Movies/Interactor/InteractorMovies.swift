//
//  InteractorMovies.swift
//  VIPER
//
//  Created by ITAU on 28-06-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import UIKit
import iOSMovieDB


class InteractorMovies: InteractorMoviesProtocol {

    var presenter: PresenterMoviesProtocol?
    private var dataSource: MoviesDataSourceProtocol
    private var provider: MovieProvider?
    private var page: Int = 1

    init(dataSource: MoviesDataSourceProtocol,
         provider: MovieProvider) {
        self.dataSource = dataSource
        self.provider = provider
    }

    func fetchMovies() {
        provider?.getUpcoming(page: page, completion: { [weak self] result in
            switch result {
            case .success(let pageMovie):
                self?.page += 1
                self?.dataSource.append(moviesNews: pageMovie.results)
                self?.presenter?.successFetchMovies(movies: pageMovie.results)
            case .failure(let error):
                debugPrint(error)
                self?.presenter?.failureFetchMovies(error: error)
            }
        })
    }

    func getMovie(row: Int) -> MovieResume? {
        return self.dataSource.getMovie(row: row)
    }
}
