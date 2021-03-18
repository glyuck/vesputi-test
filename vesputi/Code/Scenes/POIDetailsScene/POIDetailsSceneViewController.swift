//
//  POIDetailsSceneViewController.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 18.03.2021.
//

import UIKit

protocol POIDetailsSceneViewControllerProtocol: AnyObject {
}

class POIDetailsSceneViewController: VIPViewController<POIDetailsSceneInteractorProtocol> {
    let v = POIDetailsSceneView()

    override func loadView() {
        view = v
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension POIDetailsSceneViewController: POIDetailsSceneViewControllerProtocol {
}
