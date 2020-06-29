//
//  MovieViewModelResume.swift
//  VIPER
//
//  Created by ITAU on 28-06-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import iOSMovieDB
import SDWebImage
import iOSUI

struct MovieViewModelResumen: MovieViewModelProtocol {
    private var movieResume: MovieResume

    var image: UIImage
    var title: String
    var overview: String
    var popularity: String
    var idMovie: Int

    init(movie: MovieResume, image: UIImage) {
        self.movieResume = movie
        self.image = image
        self.title = self.movieResume.title
        self.overview = movieResume.overview
        self.idMovie = movie.id
        self.popularity = String(movieResume.popularity)
    }

    func configure(view: MovieDetailView) {
        view.title = self.title
        view.image = self.image
        view.overViewLabel.detail = self.overview
        view.popularityLabel.score = self.popularity
    }

}
