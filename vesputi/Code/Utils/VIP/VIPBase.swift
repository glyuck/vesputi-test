//
//  VIPBase.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 17.03.2021.
//

import Foundation
import SafariServices
import UIKit

public protocol InteractorProtocol: AnyObject {
    func activate()
}

open class VIPViewController<InteractorType>: UIViewController, AssemblableViewProtocol {
    open var interactor: InteractorType!

    override open func viewDidLoad() {
        super.viewDidLoad()
        (interactor as? InteractorProtocol)?.activate()
    }
}

open class Interactor<PresenterType, RouterType>: AssemblableInteractorProtocol {
    open var presenter: PresenterType!
    open var router: RouterType!

    public init() {
    }

    open func activate() {
        fatalError("activate must be overrided in subclass")
    }
}

open class Presenter<ViewType: AnyObject>: AssemblablePresenterProtocol {
    // We can't use "weak" here so we'll have to manually create every presenter
    open weak var viewController: ViewType!
}

open class Router<SceneFactoryType>: AssemblableRouterProtocol {
    open var sceneFactory: SceneFactoryType
    open weak var viewController: UIViewController!

    public init(sceneFactory: SceneFactoryType) {
        self.sceneFactory = sceneFactory
    }

    func pop(animated: Bool) {
        viewController.navigationController?.popViewController(animated: true)
    }

    func push(_ controller: UIViewController, animated: Bool) {
        viewController.navigationController?.pushViewController(controller, animated: animated)
    }

    func present(_ controller: UIViewController, animated: Bool) {
        controller.modalPresentationStyle = .fullScreen
        viewController.present(controller, animated: animated, completion: nil)
    }

    func presentModal(_ controller: UIViewController, animated: Bool) {
        controller.modalPresentationStyle = .overCurrentContext
        controller.modalTransitionStyle = .crossDissolve
        if let tabBacController = viewController.tabBarController {
            tabBacController.present(controller, animated: true, completion: nil)
        } else {
            viewController.present(controller, animated: true, completion: nil)
        }
    }

    func openSafari(url: URL) {
        let controller = SFSafariViewController(url: url, configuration: .init())
        viewController.present(controller, animated: true, completion: nil)
    }

    func showActivityViewController(items: [Any]) {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        viewController.present(controller, animated: true, completion: nil)
    }
}
