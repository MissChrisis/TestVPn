//
//  ChooseCoutryWireFrame.swift
//  TestVPn
//
//  Created by iOS dev on 17.05.22.
//

import UIKit

class ChooseCountryWireFrame: ChooseCountryWireFrameProtocol {
    var navigationViewController: UINavigationController
    
    init (_ navViewController: UINavigationController) {
        self.navigationViewController = navViewController
    }
    
    static func createChooseCountryModule(_ navViewController: UINavigationController) -> UIViewController {
        let view = ChooseCountryViewController()
        let presenter = ChooseCountryPresenter()
        let interactor =  ChooseCountryInteractor()
        
        interactor.presenter = presenter
        interactor.localDatamanager = CountryDataManager()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.wireFrame = ChooseCountryWireFrame(navViewController)
        presenter.interactor = interactor
        
        view.presenter = presenter
        return view
    }
    
    func upateMainView(_ country: Country) {
        if let mainPresenter = navigationViewController.viewControllers.first as? MainViewController {
            mainPresenter.presenter?.updateMainView(country)
        }
        dissmisChooseCountryScreen()
    }
    
    private func dissmisChooseCountryScreen() {
        self.navigationViewController.popToRootViewController(animated: true)
    }
}
