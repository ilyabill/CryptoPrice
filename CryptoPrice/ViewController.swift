//
//  ViewController.swift
//  CryptoPrice
//
//  Created by ILYA BILARUS on 16.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var logoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // NetworkingManager.shared.getListings()
        //        if let imageURL = NetworkingManager.shared.getImageUrl(symbol: "BTC") {
        //            guard let imageData = try Data(from: imageURL) else { return }
        //            DispatchQueue.main.async {
        //                self.logoImage.image = UIImage(
        //                    }
        //                    }
        //
        setImage()
    }
    
    func setImage() {
        
//        DispatchQueue.global().async {
//            guard let imageURL = NetworkingManager.shared.getImageUrl(symbol: "ETH") else { return }
//            guard let url = URL(string: imageURL) else { return }
//            guard let imageData = try? Data(contentsOf: url) else { return }
//
//            DispatchQueue.main.async {
//                self.logoImage.image = UIImage(data: imageData)
//            }
//        }
        NetworkingManager.shared.getImageUrl()
    }
    
    
}

