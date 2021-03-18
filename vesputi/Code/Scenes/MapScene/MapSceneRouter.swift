//
//  MapSceneRouter.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 17.03.2021.
//

import UIKit

protocol MapSceneRouterProtocol: AnyObject {
    func getPOIDetailsScene(poi: MapPOI) -> UIViewController
    func openPOIDetailsScene(poi: MapPOI)
}

class MapSceneRouter: Router<SceneFactory> {
}

extension MapSceneRouter: MapSceneRouterProtocol {
    func getPOIDetailsScene(poi: MapPOI) -> UIViewController {
        sceneFactory.poiDetailsScene(poi: poi)
    }

    func openPOIDetailsScene(poi: MapPOI) {
        let controller = getPOIDetailsScene(poi: poi)
        viewController.present(controller, animated: true)
    }
}
