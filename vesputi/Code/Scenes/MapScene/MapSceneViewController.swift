//
//  MapSceneViewController.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 17.03.2021.
//

import Mapbox
import UIKit

protocol MapSceneViewControllerProtocol: AnyObject {
    func display(annotations: [MGLAnnotation])
}

class MapSceneViewController: VIPViewController<MapSceneInteractorProtocol> {
    let v = MapSceneView()

    override func loadView() {
        view = v
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MapSceneViewController: MapSceneViewControllerProtocol {
    func display(annotations: [MGLAnnotation]) {
        v.mapView.addAnnotations(annotations)
    }
}
