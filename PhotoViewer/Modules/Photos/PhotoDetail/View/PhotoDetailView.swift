//
//  PhotoDetailView.swift
//  PhotoViewer
//
//  Created by Ohanna Perre on 05/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import UIKit

protocol PhotoDetailViewProtocol: class {
    
}

class PhotoDetailView: UIViewController, PhotoDetailViewProtocol {
    private let presenter: PhotoDetailPresenterProtocol
    
    init(with presenter: PhotoDetailPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: "PhotoDetailView", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.handleLoad(for: self)
    }
}
