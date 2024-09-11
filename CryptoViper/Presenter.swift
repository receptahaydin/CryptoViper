//
//  Presenter.swift
//  CryptoViper
//
//  Created by Recep Taha Aydın on 11.09.2024.
//

import Foundation

enum NetworkError: Error {
    case serverError
    case parsingError
}

protocol AnyPresenter {
    var router: AnyRouter? {get set}
    var interactor: AnyInteractor? {get set}
    var view: AnyView? {get set}
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>)
}

class CryptoPresenter: AnyPresenter {
    var router: AnyRouter?
    var interactor: AnyInteractor?
    var view: AnyView?
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        switch result {
        case .success(let cryptos):
            print("success")
        case .failure(let error):
            print("failure")
        }
    }
}
