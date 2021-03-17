//
//  Application.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 17.03.2021.
//

import UIKit

class Application {
    private let api = API(baseURL: Configuration.APIBaseURL)
    private let sceneFactory: SceneFactory

    init() {
        self.sceneFactory = SceneFactory(api: api)
    }

    func getInitialContoller() -> UIViewController {
        sceneFactory.mapScene()
    }
}
