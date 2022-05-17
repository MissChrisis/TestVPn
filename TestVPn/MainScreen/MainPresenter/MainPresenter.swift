//
//  MainPresenter.swift
//  TestVPn
//
//  Created by iOS dev on 17.05.22.
//

import Foundation

class MainPresenter: MainPresenterProtocol {
    weak var view: MainViewProtocol?
    var wireFrame: MainWireFrameProtocol?
    
    private var timer: Timer?
    private var counter = 0
    
    func startTimer() {
        if timer == nil {
            counter = 0
            timer = Timer.scheduledTimer(timeInterval: 1.0,
                                         target: self,
                                         selector: #selector(updateTimer),
                                         userInfo: nil,
                                         repeats: true)
            view?.startAnimation()
          }
    }
    
    @objc private func updateTimer() {
        if counter >= 5 {
            timer?.invalidate()
            timer = nil
            view?.stopAnimation()
        } else {
            counter += 1
        }
    }
    
    func showAllCountries() {
        wireFrame?.presentChooseCountryScreen()
    }
    
    func updateMainView(_ country: Country) {
        view?.updateFlagIcon(country.flag)
    }
}
