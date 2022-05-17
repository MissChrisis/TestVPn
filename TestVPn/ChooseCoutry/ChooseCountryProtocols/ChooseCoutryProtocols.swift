//
//  ChooseCoutryProtocols.swift
//  TestVPn
//
//  Created by iOS dev on 17.05.22.
//

import UIKit

protocol ChooseCountryWireFrameProtocol: AnyObject {
    static func createChooseCountryModule(_ navViewController: UINavigationController) -> UIViewController
    func upateMainView(_ country: Country)
}

protocol ChooseCountryViewProtocol: AnyObject {
    var presenter: ChooseCountryPresenterProtocol? { get set }
    func reloadInterface(_ countries: [Country])
}


protocol ChooseCountryPresenterProtocol: AnyObject {
    var view: ChooseCountryViewProtocol? { get set }
    var wireFrame: ChooseCountryWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func countryWasChooset(_ country: Country)
}

protocol ChooseCountryInterectorProtocol: AnyObject {
    var presenter: ChooseCountryPresenterProtocol? { get set }
    var localDatamanager: ChooseCountryDataManagerInputProtocol? { get set }
    
    func getCountries() -> [Country]
}

protocol ChooseCountryDataManagerInputProtocol: AnyObject {
    func getContriesList() -> [Country]
}
