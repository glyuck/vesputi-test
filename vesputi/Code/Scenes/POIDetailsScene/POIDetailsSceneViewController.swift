//
//  POIDetailsSceneViewController.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 18.03.2021.
//

import UIKit

protocol POIDetailsSceneViewControllerProtocol: AnyObject {
    func display(viewModel: POIDetailsSceneViewController.ViewModel)
}

class POIDetailsSceneViewController: VIPViewController<POIDetailsSceneInteractorProtocol> {
    struct ViewModel {
        let title: String
        let subtitle: String?
        let description: String?
    }

    let v = POIDetailsSceneView()

    override func loadView() {
        view = v
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension POIDetailsSceneViewController: POIDetailsSceneViewControllerProtocol {
    func display(viewModel: ViewModel) {
        v.titleLabel.text = viewModel.title
        v.subtitleLabel.text = viewModel.subtitle
        v.descriptionLabel.setHTMLText(viewModel.description ?? "")

        v.titleLabel.isHidden = v.titleLabel.text?.isEmpty != false
        v.subtitleLabel.isHidden = v.subtitleLabel.text?.isEmpty != false
        v.descriptionLabel.isHidden = v.descriptionLabel.attributedText?.string.isEmpty != false
    }
}
