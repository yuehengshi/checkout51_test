//
//  OfferUtilities.swift
//  Checkout 51 test
//
//  Created by yuehengshi on 2022-05-11.
//

import Foundation

class OfferUtilities {
    
    /// sort offers by name
    /// - Parameter offersList: a list of offers.
    /// - Returns: a list of offers, sorted by name (a to z)
    static func sortOffersByName(offersList: [OfferResponse.Offer]) -> [OfferResponse.Offer] {
        return offersList.sorted { $0.name < $1.name }
    }
    
    /// sort offers by name
    /// - Parameter offersList: a list of offers.
    /// - Returns: a list of offers, sorted by name (large to small)
    static func sortOffersByCashback(offersList: [OfferResponse.Offer]) -> [OfferResponse.Offer] {
        return offersList.sorted { $0.cash_back > $1.cash_back }
    }
}
