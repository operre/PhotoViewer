//
//  PhotoListView.swift
//  PhotoViewer
//
//  Created by Ohanna Perre on 04/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import UIKit

protocol PhotoListViewProtocol: class {
    func startLoading()
    func stopLoading()
    func load(photos: [Photo])
    func showEmptyState()
    func showAlert(title: String, message: String)
}

class PhotoListView: UICollectionViewController, PhotoListViewProtocol {
    private let presenter: PhotoListPresenterProtocol
    
    private var photos: [Photo] = []
    private let itemsPerRow: CGFloat = 2
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let activityIndicator = UIActivityIndicatorView(style: .gray)
    
    init(with presenter: PhotoListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: "PhotoListView", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register((UINib(nibName: PhotoCell.reuseIdentifier, bundle: nil)),
                                      forCellWithReuseIdentifier: PhotoCell.reuseIdentifier)
        self.setupLoadingView()
        self.presenter.handleLoad(for: self)
    }
    
    func startLoading() {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
        }
    }
    
    func stopLoading() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
        }
    }
    
    func load(photos: [Photo]) {
        self.photos = photos
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func showEmptyState() {
        // TODO: Create an empty state view
    }
    
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: - Helpers
    
    private func setupLoadingView() {
        self.activityIndicator.center = self.view.center
        self.view.addSubview(self.activityIndicator)
    }
}

// MARK: - UICollectionViewDataSource

extension PhotoListView {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseIdentifier,
                                                            for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }
        
        let photo = self.photos[indexPath.item]
        cell.configure(with: photo.url)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PhotoListView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = self.sectionInsets.left * (self.itemsPerRow + 1)
        let availableWidth = self.view.frame.width - paddingSpace
        let widthPerItem = availableWidth / self.itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return self.sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return self.sectionInsets.left
    }
}
