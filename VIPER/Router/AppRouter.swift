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
    var provider: ServiceProtocol?

    init(provider: ServiceProtocol) {
        navigation = UINavigationController()
        self.provider = provider
    }

    func start() {
        guard let navigation = self.navigation else { return }
        guard let strongProvider = self.provider else { return }
        let movieRouter = MoviesRouter(navigation: navigation,
                                       service: strongProvider)
        movieRouter.start()
    }

}

