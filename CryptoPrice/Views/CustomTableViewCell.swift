//
//  CustomTableViewCell.swift
//  CryptoPrice
//
//  Created by ILYA BILARUS on 16.01.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var coinNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    
    
    var imageURL: String? {
        didSet {
            configure(imageURL ?? "")
        }
    }

    func configure(_ imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        guard let imageData = try? Data(contentsOf: url) else { return }
        
        DispatchQueue.main.async {
            self.logoImage.image = UIImage(data: imageData)
        }
    }
    
    
}


