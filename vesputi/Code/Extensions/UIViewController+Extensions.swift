//
//  UIViewController+Extensions.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 18.03.2021.
//

import UIKit

extension UIViewController {
    func embedViewController(_ controller: UIViewController, container: UIView) {
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        container.embedView(controller.view)
        addChild(controller)
        controller.didMove(toParent: self)
    }
}
