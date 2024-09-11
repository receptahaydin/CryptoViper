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
    var interactor: AnyInteractor? {
        didSet {
            interactor?.downloadCryptos()
        }
    }
    var view: AnyView?
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        switch result {
        case .success(let cryptos):
            view?.update(with: cryptos)
        case .failure(let error):
            view?.update(with: error.localizedDescription)
        }
    }
}
