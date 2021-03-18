//
//  MapScenePresenter.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 17.03.2021.
//

import Foundation
import Mapbox

protocol MapScenePresenterProtocol {
    func present(pois: [MapPOI])
    func present(poiDetailsScene: UIViewController)
}

class MapScenePresenter: AssemblablePresenterProtocol {
    weak var viewController: MapSceneViewControllerProtocol!
}

extension MapScenePresenter: MapScenePresenterProtocol {
    func present(pois: [MapPOI]) {
        viewController.display(annotations: pois.map {
            let annotation = MGLPointAnnotation()
            annotation.coordinate = $0.position
            return annotation
        })
    }

    func present(poiDetailsScene: UIViewController) {
        viewController.display(poiDetailsScene: poiDetailsScene)
    }
}
