//
//  CountryTableViewCell.swift
//  TestVPn
//
//  Created by iOS dev on 17.05.22.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    @IBOutlet weak var countryFlagImageView: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        countryFlagImageView.layer.cornerRadius = countryFlagImageView.bounds.height / 2.0
    }

    func updateCell(_ country: Country) {
        countryNameLabel.text = country.countryName
        countryFlagImageView.image = country.flag
    }
}
