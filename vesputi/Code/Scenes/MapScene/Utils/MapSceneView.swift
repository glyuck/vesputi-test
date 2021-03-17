//
//  MapSceneView.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 17.03.2021.
//

import Mapbox
import UIKit

class MapSceneView: UIView {
    let mapView: MGLMapView = {
        $0.setCenter(CLLocationCoordinate2D(latitude: 59.31, longitude: 18.06), zoomLevel: 9, animated: false)
        return $0
    }(MGLMapView(frame: UIScreen.main.bounds, styleURL: URL(string: "mapbox://styles/mapbox/streets-v11")))

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

        setupConstraints()
    }

    func setupConstraints() {
        mapView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: topAnchor),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
