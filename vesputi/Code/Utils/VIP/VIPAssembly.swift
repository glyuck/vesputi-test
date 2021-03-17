//
//  VIPAssembly.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 17.03.2021.
//

import UIKit

public protocol AssemblableViewProtocol: AnyObject {
    associatedtype InteractorType
    var interactor: InteractorType! { get set }
}

public protocol AssemblableInteractorProtocol: InteractorProtocol {
    associatedtype PresenterType
    associatedtype RouterType
    var presenter: PresenterType! { get set }
    var router: RouterType! { get set }
}

public protocol AssemblablePresenterProtocol: AnyObject {
    associatedtype ViewType
    var viewController: ViewType! { get set }
}

public protocol AssemblableRouterProtocol: AnyObject {
    var viewController: UIViewController! { get set }
}

public func assembleVIP<ViewType: AssemblableViewProtocol, InteractorType: AssemblableInteractorProtocol, PresenterType: AssemblablePresenterProtocol, RouterType: AssemblableRouterProtocol>
(viewController: ViewType, interactor: InteractorType, presenter: PresenterType, router: RouterType) -> ViewType {
    // swiftlint:disable force_cast
    viewController.interactor = (interactor as! ViewType.InteractorType)
    interactor.presenter = (presenter as! InteractorType.PresenterType)
    interactor.router = (router as! InteractorType.RouterType)
    presenter.viewController = (viewController as! PresenterType.ViewType)
    router.viewController = (viewController as! UIViewController)
    // swiftlint:enable
    return viewController
}
