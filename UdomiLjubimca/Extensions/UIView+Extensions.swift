//
//  UIView+Extensions.swift
//  UdomiLjubimca
//
//  Created by Dejan Zuza on 13. 5. 2021..
//

import UIKit

extension UIView {
    /// Tranforms existing view into autolayout
    func autoLayoutView() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}
