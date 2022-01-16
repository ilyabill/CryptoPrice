//
//  CoinTableViewController.swift
//  CryptoPrice
//
//  Created by ILYA BILARUS on 16.01.2022.
//

import UIKit

class CoinTableViewController: UITableViewController {
    
    var listing: ListingModel?
    var coinsSymbols: [String] = []
    var detailedCoinData: [String : InfoModel.Data] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ImageManager.shared.delegate = self
        NetworkingManager.shared.delegate = self
        NetworkingManager.shared.getListings()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listing?.data.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell

        if let listing = listing {
            let symbol = listing.data[indexPath.row].symbol
            cell.coinNameLabel.text = symbol
            let price = String(format: "%.3f", listing.data[indexPath.row].quote.usd.price)
            //let price = String(listing.data[indexPath.row].quote.usd.price)
            cell.priceLabel.text = "Price: " + price + "$"
            
            cell.imageURL = detailedCoinData[symbol]?.logo ?? nil
        }
        
       

        return cell
    }

}


extension CoinTableViewController: CoinManagerDelegate {
    func didUpdateDataList(dataList: ListingModel) {
        DispatchQueue.global().async {
            self.listing = dataList
            self.coinsSymbols = []
            for data in dataList.data {
                self.coinsSymbols.append(data.symbol)
            }
            ImageManager.shared.getImageUrl(symbols: self.coinsSymbols)
            
        }
    }
}

extension CoinTableViewController: ImageManagerDelegate {
    func didUpdateData(data: [String : InfoModel.Data]) {
        self.detailedCoinData = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
