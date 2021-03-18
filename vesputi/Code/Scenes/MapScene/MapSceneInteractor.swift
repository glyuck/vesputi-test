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
    private let api: API
    private var pois: [MapPOI]?

    init(api: API) {
        self.api = api
    }

    override func activate() {
        loadData()
    }
}

private extension MapSceneInteractor {
    func loadData() {
        _ = api
            .getFeatures()
            .sink { completion in
                if case let .failure(error) = completion {
                    print("Failed to load data: \(error)")
                }
            } receiveValue: { [weak self] pois in
                self?.pois = pois
                self?.presenter.present(pois: pois)
            }
    }
}

extension MapSceneInteractor: MapSceneInteractorProtocol {
}
