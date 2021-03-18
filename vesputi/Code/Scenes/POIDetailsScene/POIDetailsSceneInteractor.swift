//
//  POIDetailsSceneInteractor.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 18.03.2021.
//

import Foundation

protocol POIDetailsSceneInteractorProtocol: InteractorProtocol {
}

class POIDetailsSceneInteractor: Interactor<POIDetailsScenePresenterProtocol, POIDetailsSceneRouterProtocol> {
    let poi: MapPOI

    init(poi: MapPOI) {
        self.poi = poi
    }

    override func activate() {
        presenter.present(poi: poi)
    }
}

extension POIDetailsSceneInteractor: POIDetailsSceneInteractorProtocol {
}
