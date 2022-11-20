//
//  FlightFilter.swift
//  STFlightKit
//
//  Created by ST-iOS on 11/20/22.
//

import Foundation

class FlightFilter: Codable {
    let airlines: [Airline]
    let price: FlightPriceRange
    let stoppages: [FlightStoppage]
    let origin, destination, layover: [Airport]
    let weight: [FlightWeight]
    let departTimeSlot: [TimeSlot]
    let returnTimeSlot: [TimeSlot]?
    let refundable: Int?
    let isRefundable: [IsRefundable]?

    enum CodingKeys: String, CodingKey {
        case price, airlines, origin, destination, layover, weight, refundable
        case departTimeSlot = "outbound"
        case returnTimeSlot = "return"
        case stoppages = "stop"
        case isRefundable
    }
    
    struct IsRefundable: Codable {
        let key: String
        let value: Int
    }
}

enum FlightFilterType: Int, CaseIterable {
    case reset
    case priceRange
    case refundble
    case schedule
    case stoppage
    case airline
    case layover
    case weight
    
    var title: String {
        switch self {
        case .reset:
            return "Sort & Filter"
        case .priceRange:
            return "Price Range"
        case .schedule:
            return "Schedule"
        case .stoppage:
            return "Stops"
        case .airline:
            return "Airline"
        case .layover:
            return "Layover"
        case .weight:
            return "Weight"
        case .refundble:
            return "Refundable"
        }
    }
    
    var subTitle: String {
        switch self {
        case .priceRange:
            return "10,000 - 500,000"
        default:
            return "Any"
        }
    }
    
    var rowCount: Int {
        switch self {
        case .reset, .priceRange:
            return 1
        default:
            return 0
        }
    }
}

enum ScheduleCellType {
    case title(text: String)
    case departTimeSlot(key: String, value: String)
    case returnTimeSlot(key: String, value: String)
    
    var timeSlotKey: String? {
        switch self {
        case .title:
            return nil
        case .departTimeSlot(let key, _), .returnTimeSlot(let key, _):
            return key
        }
    }
    
    func equalType(with scheduleCellType: ScheduleCellType) -> Bool {
        switch (self, scheduleCellType) {
        case ( .departTimeSlot(_, _), .departTimeSlot(_, _)):
            return true
        case ( .returnTimeSlot(_, _), .returnTimeSlot(_, _)):
            return true
        default:
            return false
        }
    }
}

class FlightSearchFilter: Encodable {
    let page: Int
    let searchId: String
    let filter: FlightFilterData?
    
    init(page: Int, searchId: String, filter: FlightFilterData?) {
        self.page = page
        self.searchId = searchId
        self.filter = filter
    }
    
    enum CodingKeys: String, CodingKey {
        case page
        case searchId
        case filter
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try? container.encode(page, forKey: .page)
        try? container.encode(searchId, forKey: .searchId)
        
        if let filter = filter, filter.hasAtleastOneFilter() {
            try? container.encodeIfPresent(filter, forKey: .filter)
        }
    }
}
