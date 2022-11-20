//
//  FlightFilterData.swift
//  STFlightKit
//
//  Created by ST-iOS on 11/20/22.
//

import Foundation

struct FlightFilterData: Encodable {
    var price: FlightPriceRange?
    var airlines: [String]?
    var stoppage: [Int]?
    var layover: [String]?
    var weight: [Int]?
    var departTimeSlot: String?
    var returnTimeSlot: String?
    var isRefundable: [Int]?
    var sort: String?
    
    enum CodingKeys: String, CodingKey {
        case price, airlines, layover, weight, isRefundable, sort
        case departTimeSlot = "outbound"
        case returnTimeSlot = "return"
        case stoppage = "stops"
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try? container.encodeIfPresent(price, forKey: .price)
        try? container.encodeIfPresent(airlines, forKey: .airlines)
        try? container.encodeIfPresent(stoppage, forKey: .stoppage)
        try? container.encodeIfPresent(layover, forKey: .layover)
        try? container.encodeIfPresent(weight, forKey: .weight)
        try? container.encodeIfPresent(departTimeSlot, forKey: .departTimeSlot)
        try? container.encodeIfPresent(returnTimeSlot, forKey: .returnTimeSlot)
        try? container.encodeIfPresent(isRefundable, forKey: .isRefundable)
        try? container.encodeIfPresent(sort, forKey: .sort)
    }
    
    func hasAtleastOneFilter() -> Bool {
        return (price != nil || airlines != nil || stoppage != nil || layover != nil || weight != nil || departTimeSlot != nil || returnTimeSlot != nil || isRefundable != nil || sort != nil)
    }
    
    mutating func reset() {
        price = nil
        airlines = nil
        stoppage = nil
        layover = nil
        weight = nil
        departTimeSlot = nil
        returnTimeSlot = nil
        isRefundable = nil
        sort = nil
    }
}
