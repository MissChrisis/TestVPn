//
//  CountryDataManager.swift
//  TestVPn
//
//  Created by iOS dev on 17.05.22.
//

import Foundation

class CountryDataManager: ChooseCountryDataManagerInputProtocol {
    func getContriesList() -> [Country] {
        let countries: [Country] = CountryCode.isoCountryCodeDictionary.map { countryCode, _ in
            return Country(countryCode: countryCode)
        }
        return countries
    }
}
