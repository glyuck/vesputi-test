//
//  POIDetailsSceneView.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 18.03.2021.
//

import UIKit

class POIDetailsSceneView: UIView {
    let scrollView: UIScrollView = {
        $0.isScrollEnabled = false
        return $0
    }(UIScrollView())

    let vStackView: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 12
        return $0
    }(UIStackView())

    let titleLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        $0.textColor = UIColor.darkText
        $0.numberOfLines = 0
        return $0
    }(UILabel())

    let subtitleLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textColor = UIColor.darkText
        $0.numberOfLines = 0
        return $0
    }(UILabel())

    let descriptionLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .light)
        $0.textColor = UIColor.darkText
        $0.numberOfLines = 0
        return $0
    }(UILabel())

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

        addSubview(scrollView)
        scrollView.addSubview(vStackView)
        vStackView.addArrangedSubview(titleLabel)
        vStackView.addArrangedSubview(subtitleLabel)
        vStackView.addArrangedSubview(descriptionLabel)

        setupConstraints()
    }

    func setupConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        vStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

            vStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -Constants.UI.defaultInsets.leading - Constants.UI.defaultInsets.trailing),
            vStackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: Constants.UI.defaultInsets.top),
            vStackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: Constants.UI.defaultInsets.leading),
            vStackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -Constants.UI.defaultInsets.trailing),
            vStackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: Constants.UI.defaultInsets.bottom),
        ])
    }
}
