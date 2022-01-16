//
//  ViewController.swift
//  CryptoPrice
//
//  Created by ILYA BILARUS on 16.01.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NetworkingManager.shared.getData()
    }


}

