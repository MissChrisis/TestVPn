//
//  MainWireFrame.swift
//  TestVPn
//
//  Created by iOS dev on 17.05.22.
// 

import UIKit

class MainWireFrame: MainWireFrameProtocol {
    var navigationViewController: UINavigationController
    init (_ navViewController: UINavigationController) {
        self.navigationViewController = navViewController
    }
    class func createMainModule() -> UIViewController {
        let navController = UINavigationController()
        let view = MainViewController()
        navController.setViewControllers([view], animated: false)
        let presenter = MainPresenter()
        presenter.view = view
        presenter.wireFrame = MainWireFrame(navController)
        
        view.presenter = presenter
        return navController
    }
    
    func presentChooseCountryScreen() {
        let chooseCountryModule = ChooseCountryWireFrame.createChooseCountryModule(navigationViewController)
        navigationViewController.pushViewController(chooseCountryModule, animated: false)
    }
}
