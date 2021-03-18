//
//  POIDetailsPopoverInteraction.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 18.03.2021.
//

import UIKit

class POIDetailsPopoverInteraction {
    enum Const {
        static let containerHeight = MapSceneView.Layout.poiDetailsContainerHeight
        static let dismissThreshold = containerHeight / 2
    }

    private unowned let controller: UIViewController
    private let container: UIView

    private var initialPanPoint: CGPoint = .zero

    init(controller: UIViewController, container: UIView) {
        self.controller = controller
        self.container = container

        container.alpha = 0
        container.transform = CGAffineTransform(translationX: 0, y: Const.containerHeight)
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        container.addGestureRecognizer(panGestureRecognizer)
    }

    func show(scene: UIViewController) {
        controller.embedViewController(scene, container: container)
        UIView.transition(
            with: container,
            duration: Constants.UI.animatinoDuration,
            options: [.curveEaseInOut, .beginFromCurrentState, .transitionCrossDissolve],
            animations: {
                self.container.alpha = 1
                self.container.transform = .identity
            },
            completion: nil
        )
    }

    func hide() {
        UIView.animate(withDuration: Constants.UI.animatinoDuration) {
            self.container.alpha = 1
            self.container.transform = CGAffineTransform(translationX: 0, y: Const.containerHeight)
        }
    }
}

private extension POIDetailsPopoverInteraction {
    @objc func onPan(_ gesture: UIPanGestureRecognizer) {
        let touchPoint = gesture.location(in: container.window)
        let translationY = touchPoint.y - initialPanPoint.y
        let velocity = gesture.velocity(in: container).y

        switch gesture.state {
        case .began:
            initialPanPoint = touchPoint
        case .changed:
            if touchPoint.y > initialPanPoint.y {
                container.transform = CGAffineTransform(translationX: 0, y: translationY)
                container.alpha = 1 - translationY / Const.containerHeight
            }
        case .ended, .cancelled:
            if translationY + velocity > Const.dismissThreshold {
                hide()
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.container.transform = .identity
                    self.container.alpha = 1
                })
            }
        case .failed, .possible:
            break
        @unknown default:
            break
        }
    }
}
