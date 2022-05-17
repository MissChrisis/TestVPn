//
//  Country.swift
//  TestVPn
//
//  Created by iOS dev on 17.05.22.
//

import UIKit

class Country {
    var countryCode: String
    var countryName: String
    
    /// Image (Flag) of country
    var flag: UIImage? {
        if image != nil {
            return image
        }

        let bundle = Bundle(for: Country.self)

        let flagImg = UIImage(named: imagePath, in: bundle, compatibleWith: nil)
        image = flagImg
        return image
    }

    private var imagePath: String
    private var image: UIImage?

    init(countryCode code: String) {
        self.countryCode = code
        imagePath = "CountryPickerController.bundle/\(self.countryCode)"
        countryName = mapCountryName(self.countryCode)
    }
}

fileprivate func mapCountryName(_ countryCode: String) -> String {
    let locale = Locale(identifier: Locale.preferredLanguages.first!)
    guard let localisedCountryName = locale.localizedString(forRegionCode: countryCode) else {
        let message = "Failed to localised country name for Country Code:- \(countryCode)"
        fatalError(message)
    }
    return localisedCountryName
}

extension Country: Equatable {
    public static func == (lhs: Country, rhs: Country) -> Bool {
        return (lhs.countryCode == rhs.countryCode)
    }
}

