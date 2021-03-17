//
//  SceneFactory.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 17.03.2021.
//

import UIKit

class SceneFactory {
    func mapScene() -> UIViewController {
        assembleVIP(
            viewController: MapSceneViewController(),
            interactor: MapSceneInteractor(),
            presenter: MapScenePresenter(),
            router: MapSceneRouter(sceneFactory: self)
        )
    }
}
