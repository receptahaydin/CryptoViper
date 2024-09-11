//
//  Router.swift
//  CryptoViper
//
//  Created by Recep Taha Aydın on 11.09.2024.
//

import Foundation

protocol AnyRouter {
    static func startExecution() -> AnyRouter
    
}

class CryptoRouter: AnyRouter {
    static func startExecution() -> AnyRouter {
        let router = CryptoRouter()
        return router
    }
}
