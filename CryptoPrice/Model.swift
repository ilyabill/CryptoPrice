//
//  Model.swift
//  CryptoPrice
//
//  Created by  Paul on 16.01.2022.
//

import Foundation

// MARK: - Welcome
struct Response: Codable {
    let status: Status
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int
    let name, symbol, slug: String
    let numMarketPairs: Int
    let dateAdded: String
    let tags: [String]
    let maxSupply: Int?
    let circulatingSupply, totalSupply: Double
    let platform: Platform?
    let cmcRank: Int
    let lastUpdated: String
    let quote: Quote
}

// MARK: - Platform
struct Platform: Codable {
    let id: Int
    let name, symbol, slug, tokenAddress: String
}

// MARK: - Quote
struct Quote: Codable {
    let usd: Usd

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}

// MARK: - Usd
struct Usd: Codable {
    let price, volume24H, volumeChange24H, percentChange1H: Double
    let percentChange24H, percentChange7D, percentChange30D, percentChange60D: Double
    let percentChange90D, marketCap, marketCapDominance, fullyDilutedMarketCap: Double
    let lastUpdated: String

}

// MARK: - Status
struct Status: Codable {
    let timestamp: String
    let errorCode: Int
    let errorMessage: String?
    let elapsed, creditCount: Int
    let notice: String?
    let totalCount: Int

}
