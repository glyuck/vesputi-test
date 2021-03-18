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
    func display(poiDetailsScene: UIViewController)
}

class MapSceneViewController: VIPViewController<MapSceneInteractorProtocol> {
    private var annotations: [MGLAnnotation]?
    private var poiDetailsPopoverInteraction: POIDetailsPopoverInteraction!

    let v = MapSceneView()

    override func loadView() {
        view = v
    }

    override func viewDidLoad() {
        poiDetailsPopoverInteraction = POIDetailsPopoverInteraction(controller: self, container: v.poiDetailsContainer)
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

    func display(poiDetailsScene: UIViewController) {
        poiDetailsPopoverInteraction.show(scene: poiDetailsScene)
    }
}
