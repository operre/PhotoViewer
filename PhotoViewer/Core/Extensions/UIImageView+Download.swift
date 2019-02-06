//
//  UIImageView+Download.swift
//  PhotoViewer
//
//  Created by Ohanna Perre on 04/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with url: URL, using placeholder: UIImage? = UIImage(named: "placeholder")) {
        self.kf.setImage(with: url, placeholder: placeholder)
    }
}
