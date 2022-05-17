//
//  File.swift
//  TestVPn
//
//  Created by iOS dev on 17.05.22.
//

import Foundation

class ChooseCountryInteractor: ChooseCountryInterectorProtocol {
    var presenter: ChooseCountryPresenterProtocol?
    var localDatamanager: ChooseCountryDataManagerInputProtocol?
    
    func getCountries() -> [Country] {
        localDatamanager?.getContriesList() ?? []
    }
}
