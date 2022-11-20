//
//  FlightBasic.swift
//  STFlightKit
//
//  Created by ST-iOS on 11/20/22.
//

import Foundation

public enum ClassType: String, Codable {
    case economy        = "Economy"
    case premiumEconomy = "Premium Economy"
    case business       = "Business"
    case firstClass     = "First"
}

public enum TripType: String, Codable {
    case oneWay    = "OneWay"
    case roundTrip = "Return"
    case multiCity = "Other"

    public static var allCases: [TripType] {
        return [.oneWay, .roundTrip, .multiCity]
    }
}

// MARK: - Airport Search
public class Airport: Codable, Equatable {
    public let iata: String
    public let name: String
    public let city: String?
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        iata = try container.decode(String.self, forKey: .iata)
        name = try container.decode(String.self, forKey: .name)
        city = try container.decodeIfPresent(String.self, forKey: .city)
    }

    public static func == (lhs: Airport, rhs: Airport) -> Bool {
        return lhs.iata == rhs.iata
    }
}

public class DateTime: Codable {
    public let date: String
    public let time: String
}

// MARK: - PriceBreakdown
public class FlightPriceBreakdown: Codable {
    public let discount, subTotal, couponAmount : Double
    public let total, originPrice, discountAmount: Double
    public let advanceIncomeTax: Double?
    public let currency: String
    public let details: [FlightPriceBreakdownDetail]
}

public class FlightPriceBreakdownDetail: Codable {
    public let type: TravellerType
    public let baseFare, tax, total: Double
    public let currency: String
    public let numberPaxes: Int
}


