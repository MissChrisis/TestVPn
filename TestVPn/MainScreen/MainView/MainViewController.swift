//
//  MainViewController.swift
//  TestVPn
//
//  Created by iOS dev on 17.05.22.
//

import UIKit

class MainViewController: UIViewController, MainViewProtocol {
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var choosetImageView: UIImageView!
    @IBOutlet weak var turnOnButton: UIButton!
    
    private var isButtonTurn: Bool = false {
        didSet {
            let titleText = isButtonTurn ? "Turn on" : "Turn off"
            turnOnButton.titleLabel?.text = titleText
        }
    }
    
    var presenter: MainPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        turnOnButton.center = view.center
        choosetImageView.layer.cornerRadius = 10.0
    }

    @IBAction func turnOnConnection(_ sender: Any) {
        if !isButtonTurn {
            presenter?.startTimer()
        } else {
            isButtonTurn = false
        }
    }
    
    @IBAction func showCountriesMenu(_ sender: Any) {
        presenter?.showAllCountries()
    }
    
    func startAnimation() {
        view.isUserInteractionEnabled = false
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.toValue = 1.2
        animation.duration = 1.0
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.autoreverses = true
        animation.repeatCount = .infinity
        turnOnButton.layer.add(animation, forKey: "pulsing")
    }
    
    func stopAnimation() {
        view.isUserInteractionEnabled = true
        isButtonTurn = true
        turnOnButton.layer.removeAllAnimations()
    }
    
    func updateFlagIcon(_ image: UIImage?) {
        choosetImageView.image = image
    }
}
