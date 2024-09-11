//
//  Router.swift
//  CryptoViper
//
//  Created by Recep Taha Aydın on 11.09.2024.
//

import Foundation
import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? {get}
    static func startExecution() -> AnyRouter
}

class CryptoRouter: AnyRouter {
    var entry: EntryPoint?
    
    static func startExecution() -> AnyRouter {
        let router = CryptoRouter()
        
        var view: AnyView = CryptoViewController()
        var presenter: AnyPresenter = CryptoPresenter()
        var interactor: AnyInteractor = CryptoInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.entry = view as? EntryPoint
        
        return router
    }
}
