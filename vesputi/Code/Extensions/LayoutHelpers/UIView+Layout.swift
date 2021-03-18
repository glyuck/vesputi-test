//
//  UIView+Layout.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 18.03.2021.
//

import UIKit

extension UIView {
    func embedView(_ view: UIView, toLayoutMargins: Bool = false, insets: NSDirectionalEdgeInsets = .zero) {
        addSubview(view)
        var constraints: [NSLayoutConstraint] = [
            view.topAnchor.constraint(equalTo: topAnchor, constant: insets.top),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -insets.bottom),
        ]
        if toLayoutMargins {
            constraints += [
                view.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: insets.leading),
                view.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -insets.trailing),
            ]
        } else {
            constraints += [
                view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets.leading),
                view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -insets.trailing),
            ]
        }
        NSLayoutConstraint.activate(constraints)
    }
}
