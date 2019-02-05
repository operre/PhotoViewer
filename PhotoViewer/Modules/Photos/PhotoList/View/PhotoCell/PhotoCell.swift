//
//  PhotoCell.swift
//  PhotoViewer
//
//  Created by Ohanna Perre on 04/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    
    static let reuseIdentifier: String = "PhotoCell"
    
    func configure(with imageURL: URL) {
        let placeholder = UIImage(named: "placeholder")
        self.photoImageView.load(url: imageURL, using: placeholder)
    }
}
