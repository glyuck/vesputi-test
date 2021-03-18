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

    func display(poiDetailsScene: UIViewController) {
        embedViewController(poiDetailsScene, container: v.poiDetailsContainer)
        UIView.transition(
            with: v.poiDetailsContainer,
            duration: Constants.UI.animatinoDuration,
            options: [.curveEaseInOut, .beginFromCurrentState, .transitionCrossDissolve],
            animations: nil,
            completion: nil
        )
    }
}
