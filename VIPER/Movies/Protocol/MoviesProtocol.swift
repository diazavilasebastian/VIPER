//
//  MoviesProtocol.swift
//  VIPER
//
//  Created by ITAU on 28-06-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import iOSMovieDB

typealias ViewMoviesProtocol = ViewMoviesInputDelegate & ViewMoviesOutputDelegate
typealias PresenterMoviesProtocol = PresenterMoviesInputDelegate & PresenterMoviesOutputDelegate
typealias InteractorMoviesProtocol = InteractorMoviesInputDelegate & InteractorMoviesOutputDelegate

/// View movies protocol define all function he expose to other layer (presenter)
protocol ViewMoviesInputDelegate {
    func showMovies()
    func errorMovies()
}

/// View Movies protocol output define the object need to delegate all interaction of user
protocol ViewMoviesOutputDelegate {
    var presenter: PresenterMoviesProtocol? { get set }
}

/// Presenter movies protocol define all function expose to other layer (view, interactor)
protocol PresenterMoviesInputDelegate {
    func fetchMovies()
    func successFetchMovies(movies: [MovieResume])
    func failureFetchMovies(error: Error)
    func selectMovie(index: IndexPath)
}

/// Presenter movies output define the object to delegate actions
protocol PresenterMoviesOutputDelegate {
    var mainView: ViewMoviesProtocol? { get set }
    var interactor: InteractorMoviesProtocol? { get set }
    var router: RouterMoviesInput? { get set }
}

/// Interactor protocol define all function he expose to other layers
protocol InteractorMoviesInputDelegate {
    func fetchMovies()
    func getMovie(row: Int) -> MovieResume?
}

/// Interactor movies output define the object to delegate actions
protocol InteractorMoviesOutputDelegate {
    var presenter: PresenterMoviesProtocol? { get set }
}

/// Router movies input define all function expose to other layers (presenter)
protocol RouterMoviesInput {
    func start()
    func goToDetailMovie(movie: MovieResume)
}

//Movies datasource provider information to other layers
protocol MoviesDataSourceProtocol {
    /// Append Movies
    /// - Parameter moviesNews: list of movies Resume to be added to local information
    func append(moviesNews: [MovieResume])
    /// getMovie
    /// - Parameter idMovie: id movie need to find  in local information
    func getMovie(idMovie: Int) -> MovieResume?
    /// getMovie
    /// - Parameter row: id movie to find in array information representation
    func getMovie(row: Int) -> MovieResume?
}
