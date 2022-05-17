//
//  ChooseCoutryViewController.swift
//  TestVPn
//
//  Created by iOS dev on 17.05.22.
//

import UIKit

class ChooseCountryViewController: UIViewController, ChooseCountryViewProtocol {
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ChooseCountryPresenterProtocol?
    private var countriesList: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "CountryTableViewCell", bundle: nil), forCellReuseIdentifier: "CountryTableViewCell")
        presenter?.viewDidLoad()
    }
    
    func reloadInterface(_ countries: [Country]) {
        self.countriesList = countries
        tableView.reloadData()
    }
}

extension ChooseCountryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as? CountryTableViewCell else {
            return UITableViewCell()
        }
        let country = countriesList[indexPath.row]
        cell.updateCell(country)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = countriesList[indexPath.row]
        presenter?.countryWasChooset(country)
    }
}

extension ChooseCountryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(110.0)
    }
}
