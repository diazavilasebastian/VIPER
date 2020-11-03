//
//  RouterMovies.swift
//  VIPER
//
//  Created by ITAU on 28-06-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import iOSMovieDB
import SDWebImage

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
        let viewModelController = MoviesControllerViewModel(dataSource: dataSource)
        let controller = MoviesViewController(viewModel: viewModelController)

        presenter.interactor = interactor
        presenter.router = self
        controller.presenter = presenter
        presenter.mainView = controller

        interactor.presenter = presenter
        navigation?.setViewControllers([controller], animated: false)
    }

    func goToDetailMovie(movie: MovieResume) {
        guard let movieURL = movie.urlPoster else { return }
        guard let image = SDImageCache.shared.imageFromDiskCache(forKey: movieURL.absoluteString) else { return }
    
        guard let service = apiService else { return }
        let provider = MovieProvider(service: service)
        let interactor = MovieDetailInteractor(provider: provider)
        let presenter = MovieDetailPresenter()
        let viewModel = MovieViewModelResumen(movie: movie, image: image)
        let controller = MovieViewController(viewModel: viewModel)
        
        presenter.interactor = interactor
        presenter.mainView = controller
        interactor.presenter = presenter
        controller.presenter = presenter
        
        navigation?.pushViewController(controller, animated: true)
    }


}

