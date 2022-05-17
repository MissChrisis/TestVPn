//
//  MainProtocols.swift
//  TestVPn
//
//  Created by iOS dev on 17.05.22.
//

import UIKit

protocol MainWireFrameProtocol: AnyObject {
    static func createMainModule() -> UIViewController

    func presentChooseCountryScreen()
}

protocol MainViewProtocol: AnyObject {
    var presenter: MainPresenterProtocol? { get set }
    func startAnimation()
    func stopAnimation()
    func updateFlagIcon(_ image: UIImage?)
}

protocol MainPresenterProtocol: AnyObject {
    var view: MainViewProtocol? { get set }
    var wireFrame: MainWireFrameProtocol? { get set }
    func startTimer()
    func showAllCountries()
    func updateMainView(_ country: Country)
}
