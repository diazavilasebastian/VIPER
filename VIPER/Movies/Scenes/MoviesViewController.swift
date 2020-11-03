//
//  MoviesViewController.swift
//  VIPER
//
//  Created by ITAU on 28-06-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import UIKit
import iOSUI

protocol MoviesViewModel {
    var dataSource: UICollectionViewDataSource { get set }
}

class MoviesViewController: UIViewController, ViewMoviesOutputDelegate {

    private lazy var mainView: MoviesCollectionView = {
        let view = MoviesCollectionView()
        view.delegate = self
        return view
    }()

    var presenter: PresenterMoviesProtocol?

    init(viewModel: MoviesViewModel) {
        super.init(nibName: nil, bundle: nil)
        mainView.dataSource = viewModel.dataSource
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        self.presenter?.fetchMovies()
    }

}

extension MoviesViewController: ViewMoviesInputDelegate {
    func showMovies() {
        self.mainView.reloadData()
    }

    func errorMovies() {
        //Some interactor to show error when retreive movies
        debugPrint("Error retreive movies")
    }
}

extension MoviesViewController: UICollectionViewDelegate, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter?.selectMovie(index: indexPath)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //FAKE infinite scroll
        if scrollView.contentOffset.y + scrollView.frame.size.height >= scrollView.contentSize.height {
            self.presenter?.fetchMovies()
        }
    }
}

extension MoviesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let width: CGFloat = ((collectionView.bounds.size.width/2) - 10)
           let height: CGFloat = 320
           return CGSize(width: width, height: height)
       }

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
       }

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 10.0
       }

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 10.0
       }
}
