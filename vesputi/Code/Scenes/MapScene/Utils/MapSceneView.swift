//
//  MapSceneView.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 17.03.2021.
//

import Mapbox
import UIKit

class MapSceneView: UIView {
    enum Layout {
        static let poiDetailsContainerHeight = CGFloat(200)
    }

    let mapView: MGLMapView = {
        $0.setCenter(CLLocationCoordinate2D(latitude: 51.340199, longitude: 12.360103), zoomLevel: 9, animated: false)
        return $0
    }(MGLMapView(frame: UIScreen.main.bounds, styleURL: URL(string: "mapbox://styles/mapbox/streets-v11")))

    let poiDetailsContainer: UIView = {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = Constants.UI.cornerRadius
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        $0.clipsToBounds = true
        return $0
    }(UIView())

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupMapSceneView()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MapSceneView {
    func setupMapSceneView() {
        backgroundColor = .white

        addSubview(mapView)
        addSubview(poiDetailsContainer)

        setupConstraints()
    }

    func setupConstraints() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        poiDetailsContainer.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: topAnchor),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor),

            poiDetailsContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            poiDetailsContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            poiDetailsContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            poiDetailsContainer.heightAnchor.constraint(equalToConstant: Layout.poiDetailsContainerHeight),
        ])
    }
}
