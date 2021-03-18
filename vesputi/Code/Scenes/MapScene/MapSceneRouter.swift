//
//  MapSceneRouter.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 17.03.2021.
//

import UIKit

protocol MapSceneRouterProtocol: AnyObject {
    func openPOIDetailsScene(poi: MapPOI)
}

class MapSceneRouter: Router<SceneFactory> {
}

extension MapSceneRouter: MapSceneRouterProtocol {
    func openPOIDetailsScene(poi: MapPOI) {
        let controller = sceneFactory.poiDetailsScene(poi: poi)
        viewController.present(controller, animated: true)
    }
}
