//
//  RouterMovies.swift
//  VIPER
//
//  Created by ITAU on 28-06-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import iOSMovieDB

class MoviesRouter: RouterMoviesInput {
    
    var navigation: UINavigationController?
    let apiService: ServiceProtocol?

    init(navigation: UINavigationController,
         service: ServiceProtocol) {
        self.navigation = navigation
        self.apiService = service
    }

    func start() {
        guard let service = apiService else { return }
        let provider = MovieProvider(service: service)
        let dataSource = MoviesDataSource()
        let interactor = InteractorMovies(dataSource: dataSource, provider: provider)
        let presenter = PresenterMovies()
        let viewModelController = MoviesControllerViewModel(presenter: presenter, dataSource: dataSource)
        let controller = MoviesViewController(viewModel: viewModelController)

        presenter.interactor = interactor
        presenter.router = self

        interactor.presenter = presenter
        navigation?.setViewControllers([controller], animated: false)
    }

    func goToDetailMovie(movie: MovieResume) {

        
    }


}

