//
//  POIDetailsSceneView.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 18.03.2021.
//

import UIKit

class POIDetailsSceneView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPOIDetailsSceneView()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension POIDetailsSceneView {
    func setupPOIDetailsSceneView() {
        backgroundColor = .white

        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
        ])
    }
}
