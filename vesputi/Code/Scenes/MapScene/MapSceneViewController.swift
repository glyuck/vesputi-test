//
//  MapSceneViewController.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 17.03.2021.
//

import UIKit

protocol MapSceneViewControllerProtocol: AnyObject {
}

class MapSceneViewController: VIPViewController<MapSceneInteractorProtocol> {
    let v = MapSceneView()

    override func loadView() {
        view = v
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MapSceneViewController: MapSceneViewControllerProtocol {
}
