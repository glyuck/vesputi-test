//
//  SceneFactory.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 17.03.2021.
//

import UIKit

class SceneFactory {
    private let api: API

    init(api: API) {
        self.api = api
    }

    func mapScene() -> UIViewController {
        assembleVIP(
            viewController: MapSceneViewController(),
            interactor: MapSceneInteractor(api: api),
            presenter: MapScenePresenter(),
            router: MapSceneRouter(sceneFactory: self)
        )
    }

    func poiDetailsScene(poi: MapPOI) -> UIViewController {
        assembleVIP(
            viewController: POIDetailsSceneViewController(),
            interactor: POIDetailsSceneInteractor(poi: poi),
            presenter: POIDetailsScenePresenter(),
            router: POIDetailsSceneRouter(sceneFactory: self)
        )
    }
}
