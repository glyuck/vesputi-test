//
//  MapSceneInteractor.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 17.03.2021.
//

import Foundation

protocol MapSceneInteractorProtocol: InteractorProtocol {
}

class MapSceneInteractor: Interactor<MapScenePresenterProtocol, MapSceneRouterProtocol> {
    override func activate() {
    }
}

extension MapSceneInteractor: MapSceneInteractorProtocol {
}
