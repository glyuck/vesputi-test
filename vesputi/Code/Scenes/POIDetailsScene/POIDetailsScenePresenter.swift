//
//  POIDetailsScenePresenter.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 18.03.2021.
//

import Foundation

protocol POIDetailsScenePresenterProtocol {
}

class POIDetailsScenePresenter: AssemblablePresenterProtocol {
    weak var viewController: POIDetailsSceneViewControllerProtocol!
}

extension POIDetailsScenePresenter: POIDetailsScenePresenterProtocol {
}
