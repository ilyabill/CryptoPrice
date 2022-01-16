//
//  NetworkingManager.swift
//  CryptoPrice
//
//  Created by ILYA BILARUS on 16.01.2022.
//

import Foundation

struct NetworkingManager {
    
    static var shared = NetworkingManager()
    
    private init() {}
    
    
    let urlString = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest"
    let parameters = ["start": "1", "limit" : "5", "convert" : "USD"]
    let headers = ["X-CMC_PRO_API_KEY": "f6b919e9-ee0f-418e-8111-8bd8291e370a", "Accepts": "application/json"]
    
    
    func getData() {
        var urlComponents = URLComponents(string: urlString)
        
        var queryItems = [URLQueryItem]()
        for (key, value) in parameters {
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        
        urlComponents?.queryItems = queryItems
        
        
 //       print(urlComponents?.url?.description)
        
        var request = URLRequest(url: (urlComponents?.url)!)
        request.httpMethod = "GET"
        
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        //print(request.url?.description)
        print(request.mainDocumentURL?.description)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) -> Void in
            print(response)
            print(String(data: data!, encoding: .utf8))
        }
        task.resume()
    }
}
