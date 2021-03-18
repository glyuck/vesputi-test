//
//  POIDetailsScenePresenter.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 18.03.2021.
//

import Foundation

protocol POIDetailsScenePresenterProtocol {
    func present(poi: MapPOI)
}

class POIDetailsScenePresenter: AssemblablePresenterProtocol {
    weak var viewController: POIDetailsSceneViewControllerProtocol!
}

extension POIDetailsScenePresenter: POIDetailsScenePresenterProtocol {
    func present(poi: MapPOI) {
        viewController.display(
            viewModel: .init(
                title: poi.title,
                subtitle: poi.subtitle,
                description: poi.description
            )
        )
    }
}
