//
//  ImageManager.swift
//  CryptoPrice
//
//  Created by ILYA BILARUS on 16.01.2022.
//

import Foundation

protocol ImageManagerDelegate {
    func didUpdateData(data: [String : InfoModel.Data])
}


struct ImageManager {
    
    var delegate: ImageManagerDelegate?
    
    static var shared = ImageManager()
    
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
    
    
    func getImageUrl(symbols: [String]) {
        let symbol = symbols.compactMap{ $0 }.joined(separator: ",")
        let urlString = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/info"
        let parameters = ["symbol": symbol]
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
            guard let info = try? jsonDecoder.decode(InfoModel.self, from: data!) else {return}
            let infoData = info.data
            delegate?.didUpdateData(data: infoData)
        }
        task.resume()
        
    }
    
}
