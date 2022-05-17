//
//  ChooseCountryPresenter.swift
//  TestVPn
//
//  Created by iOS dev on 17.05.22.
//

import Foundation

class ChooseCountryPresenter: ChooseCountryPresenterProtocol {
    weak var view: ChooseCountryViewProtocol?
    var wireFrame: ChooseCountryWireFrameProtocol?
    var interactor: ChooseCountryInterectorProtocol?
    

    func viewDidLoad() {
        if let countries = interactor?.getCountries() {
            view?.reloadInterface(countries)
        }
    }
    
    func countryWasChooset(_ country: Country) {
        wireFrame?.upateMainView(country)
    }
}
