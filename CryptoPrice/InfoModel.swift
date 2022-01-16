//
//  InfoModel.swift
//  CryptoPrice
//
//  Created by ILYA BILARUS on 16.01.2022.
//

import Foundation

// MARK: - Welcome
struct InfoModel: Codable {
    let status: Status
    let data: [String: Data]
    
    
    // MARK: - Datum
    struct Data: Codable {
        let id: Int
        let name, symbol, category, datumDescription: String
        let slug: String
        let logo: String
        let subreddit, notice: String
        let dateAdded: String
    }
    
    
    // MARK: - Status
    struct Status: Codable {
        let timestamp: String
        let errorCode: Int
        let errorMessage: String?
        let elapsed, creditCount: Int
        let notice: String?
    }
}

