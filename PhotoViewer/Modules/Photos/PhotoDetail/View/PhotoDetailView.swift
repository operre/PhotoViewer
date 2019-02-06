//
//  PhotoDetailView.swift
//  PhotoViewer
//
//  Created by Ohanna Perre on 05/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import UIKit

protocol PhotoDetailViewProtocol: class {
    func startLoading()
    func stopLoading()
    func load(detailedPhoto: DetailedPhoto)
}

class PhotoDetailView: UIViewController, PhotoDetailViewProtocol {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    private let presenter: PhotoDetailPresenterProtocol
    private let activityIndicator = UIActivityIndicatorView(style: .gray)
    
    init(with presenter: PhotoDetailPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: "PhotoDetailView", bundle: .main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupLoadingView()
        self.presenter.handleLoad(for: self)
    }
    
    // MARK: - Interface implementation
    
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
    
    func load(detailedPhoto: DetailedPhoto) {
        DispatchQueue.main.async {
            self.photoImageView.setImage(with: detailedPhoto.photo.url)
            self.titleLabel.text = detailedPhoto.title
            self.descriptionLabel.text = detailedPhoto.description
        }
    }
    
    // MARK: - Helpers
    
    private func setupLoadingView() {
        self.activityIndicator.center = self.navigationController?.view.center ?? self.view.center
        self.view.addSubview(self.activityIndicator)
    }
}
