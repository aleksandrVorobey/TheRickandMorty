//
//  Extensions.swift
//  TheRickAndMorty
//
//  Created by admin on 17.05.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({addSubview($0)})
    }
}
