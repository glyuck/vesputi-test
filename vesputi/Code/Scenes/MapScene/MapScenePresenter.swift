//
//  MapScenePresenter.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 17.03.2021.
//

import Foundation

protocol MapScenePresenterProtocol {
}

class MapScenePresenter: AssemblablePresenterProtocol {
    weak var viewController: MapSceneViewControllerProtocol!
}

extension MapScenePresenter: MapScenePresenterProtocol {
}
