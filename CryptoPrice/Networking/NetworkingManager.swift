//
//  NetworkingManager.swift
//  CryptoPrice
//
//  Created by ILYA BILARUS on 16.01.2022.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateDataList(dataList: ListingModel)
}

struct NetworkingManager {
    
    var delegate: CoinManagerDelegate?
    
    static var shared = NetworkingManager()
    
    private init() {}
    
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        
        // TODO: pick the right formatter and decode to dates
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    func getListings() {
        let urlString = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest"
        let parameters = ["start": "1", "limit" : "100", "convert" : "USD"]
        let headers = ["X-CMC_PRO_API_KEY": "f6b919e9-ee0f-418e-8111-8bd8291e370a", "Accepts": "application/json"]
        
        
        
        var urlComponents = URLComponents(string: urlString)
        
        //        var queryItems = [URLQueryItem]()
        //        for (key, value) in parameters {
        //            queryItems.append(URLQueryItem(name: key, value: value))
        //        }
        
        urlComponents?.queryItems = parameters.compactMap{ URLQueryItem(name: $0, value: $1) }
        
        var request = URLRequest(url: (urlComponents?.url)!)
        request.httpMethod = "GET"
        
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) -> Void in
            // Test decoding
            if let list = try? jsonDecoder.decode(ListingModel.self, from: data!) {
//            print(list)
//            print(list.status.timestamp.description)
            delegate?.didUpdateDataList(dataList: list)
            }
        }
        task.resume()
    }
    
    
    
}
