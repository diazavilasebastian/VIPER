//
//  VIPERRouter.swift
//  VIPER
//
//  Created by ITAU on 28-06-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import UIKit
import iOSMovieDB

protocol RouterProtocol {
    var navigation: UINavigationController? { get set }

    func start()
}

class AppRouter: RouterProtocol {
    var navigation: UINavigationController?

    init() {
        navigation = UINavigationController()
    }


    func start() {
        let service = ApiService(apiKey: "6893e0b3a6030f46d850edf87283de46")
        let provider = MovieProvider(service: service)
        let dataSource = MoviesDataSource()
        let router = MoviesRouter()
        let interactor = InteractorMovies(dataSource: dataSource, provider: provider)
        let presenter = PresenterMovies()
        let viewModelController = MoviesControllerViewModel(presenter: presenter, dataSource: dataSource)
        let controller = MoviesViewController(viewModel: viewModelController)

        presenter.interactor = interactor
        presenter.router = router

        interactor.presenter = presenter
        navigation?.setViewControllers([controller], animated: false)
    }

}

