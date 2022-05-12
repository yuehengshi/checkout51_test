//
//  OfferService.swift
//  Checkout 51 test
//
//  Created by yuehengshi on 2022-05-11.
//

import Foundation
import Alamofire

//the offer model to decode from json
struct OfferResponse: Codable {
    
    struct Offer: Codable {
        let offer_id: String
        let name: String
        let image_url: String
        let cash_back: Double
    }
    
    let offers: [Offer]
}

class OfferService {
    static func getOffers(completion: @escaping ([OfferResponse.Offer]) -> ()) {
        AF.request("https://firebasestorage.googleapis.com/v0/b/fosterwaytest.appspot.com/o/c51.json?alt=media&token=3f2b9273-db8f-4918-8ce1-185397a0b103").response { response in
            do {
                guard let data = response.data else {
                    return completion([])
                }
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                let decoder = JSONDecoder()
                let offers = try decoder.decode(OfferResponse.self, from: data).offers
//                                do {
//                                    try decoder.decode(OfferResponse.self, from: data).offer
//                                    } catch let DecodingError.dataCorrupted(context) {
//                                        print(context)
//                                    } catch let DecodingError.keyNotFound(key, context) {
//                                        print("Key '\(key)' not found:", context.debugDescription)
//                                        print("codingPath:", context.codingPath)
//                                    } catch let DecodingError.valueNotFound(value, context) {
//                                        print("Value '\(value)' not found:", context.debugDescription)
//                                        print("codingPath:", context.codingPath)
//                                    } catch let DecodingError.typeMismatch(type, context)  {
//                                        print("Type '\(type)' mismatch:", context.debugDescription)
//                                        print("codingPath:", context.codingPath)
//                                    } catch {
//                                        print("error: ", error)
//                                    }
                completion(offers)
            }
            catch {
                completion([])
            }
        }
    }
}
