//
//  OfferListViewModel.swift
//  Checkout 51 test
//
//  Created by yuehengshi on 2022-05-11.
//

import Foundation
import UIKit
import Nuke

protocol OfferViewModelDelegate: AnyObject {
    func offersChanged()
}

class OfferListViewModel {
    weak var delegate: OfferViewModelDelegate?
    let numberOfSections = 1
    var offers = [OfferResponse.Offer]()
    var sortedOffers = [OfferResponse.Offer]()
    var onSort = false
    let reuseIdentifier = "OfferListViewCell"
    
    /// In case there are multiple json data, I'd like to use DispatchGroup to get them together
    func getAllOffers() {
        OfferService.getOffers { [weak self] response in
            self?.offers = response
            self?.delegate?.offersChanged()
        }
    }
    
    func sortOffersByName(){
        onSort = true
        sortedOffers = OfferUtilities.sortOffersByName(offersList: offers)
        delegate?.offersChanged()
    }
    
    func sortOffersByCashback(){
        onSort = true
        sortedOffers = OfferUtilities.sortOffersByCashback(offersList: offers)
        delegate?.offersChanged()
    }
    
    func sortReset(){
        onSort = false
        delegate?.offersChanged()
    }

    func numberOfRowsInSection(_ section: Int) -> Int {
        return onSort ? sortedOffers.count : offers.count
    }

    func offerForIndexPath(_ indexPath: IndexPath) -> OfferResponse.Offer {
        return onSort ? sortedOffers[indexPath.row] : offers[indexPath.row]
    }
    
    func getCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! OfferListViewCell
        let offer = self.offerForIndexPath(indexPath)
        Nuke.loadImage(with: offer.image_url, into: cell.offerImage)
        cell.offerName.text = offer.name
        cell.offerCashback.text = "$ \(offer.cash_back) Cash Back"
        return cell
    }
}
