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
}
