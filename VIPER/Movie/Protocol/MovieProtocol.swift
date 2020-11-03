//
//  MovieProtocol.swift
//  VIPER
//
//  Created by ITAU on 28-06-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import iOSMovieDB

typealias ViewMovieDetailProtocol = ViewMovieDetailInputDelegate & ViewMovieDetailOutputDelegate
typealias PresenterMovieDetailProtocol = PresenterMovieDetailInputDelegate & PresenterMovieDetailOutputDelegate
typealias InteractorMovieDetailProtocol = InteractorMovieDetailInputDelegate & InteractorMovieDetailOutputDelegate

protocol ViewMovieDetailInputDelegate: class {
    func showDetail(from movie: Movie)
    func errorFetchDetails(error: Error)
}

protocol ViewMovieDetailOutputDelegate: class {
    var presenter: PresenterMovieDetailProtocol? { get set }
}

protocol PresenterMovieDetailInputDelegate: class {
    func fetchDetails(from idMovie: Int)
    func successFetchDetails(movie: Movie)
    func errorFetchDetails(error: Error)
}

protocol PresenterMovieDetailOutputDelegate: class {
    var mainView: ViewMovieDetailProtocol? { get set }
    var interactor: InteractorMovieDetailProtocol? { get set }
}

protocol InteractorMovieDetailInputDelegate: class {
    func fetchDetail(id: Int)
}

protocol InteractorMovieDetailOutputDelegate: class {
    var presenter: PresenterMovieDetailProtocol? { get set }
}

protocol RouterDetailProtocol {
    var navigation: UINavigationController? { get set }
    func start(movie: MovieResume)
}

