//
//  MoviesCollectionView.swift
//  VIPER
//
//  Created by ITAU on 28-06-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import UIKit

class MoviesCollectionView: UIView {

    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(MoviesCollectionViewCell.self, forCellWithReuseIdentifier: MoviesCollectionViewCell.identifier)
        return view
    }()

    var delegate: UICollectionViewDelegate? {
        didSet { self.collectionView.delegate = delegate }
    }

    var dataSource: UICollectionViewDataSource? {
        didSet { self.collectionView.dataSource = dataSource }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        self.setupHierarchy()
        self.setupConstraints()
        self.configView()
    }

    func setupHierarchy() {
        self.addSubview(collectionView)
    }

    func reloadData() {
        collectionView.reloadData()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            .init(item: collectionView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
            .init(item: collectionView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0),
            .init(item: self, attribute: .trailing, relatedBy: .equal, toItem: collectionView, attribute: .trailing, multiplier: 1.0, constant: 0),
            .init(item: self, attribute: .bottom, relatedBy: .equal, toItem: collectionView, attribute: .bottom, multiplier: 1.0, constant: 0),
        ])
    }

    func configView() {
        self.collectionView.backgroundColor = .black
    }
}
