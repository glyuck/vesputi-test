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
    private var annotations: [MGLAnnotation]?

    let v = MapSceneView()

    override func loadView() {
        view = v
    }

    override func viewDidLoad() {
        v.mapView.delegate = self

        super.viewDidLoad()
    }
}

extension MapSceneViewController: MapSceneViewControllerProtocol {
    func display(annotations: [MGLAnnotation]) {
        self.annotations = annotations

        v.mapView.addAnnotations(annotations)
    }
}

extension MapSceneViewController: MGLMapViewDelegate {
    func mapView(_ mapView: MGLMapView, didSelect annotation: MGLAnnotation) {
        guard let index = annotations?.firstIndex(where: { $0 === annotation }) else {
            return
        }
        interactor.actionSelectPOI(index: index)
    }
}
