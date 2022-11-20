//
//  FlightLeg.swift
//  STFlightKit
//
//  Created by ST-iOS on 11/20/22.
//

import STCoreKit

public struct FlightLegData {
    public let originName: String
    public let destinationName: String
    public let airplaneName: String
    public let airplaneLogo: String
    public let departureTime: String
    public let arrivalTime: String
    public let stop: Int
    public let dayCount: Int
    public let duration: String
}

public struct FlightRow {
    public let currency: String
    public let totalPrice: Double
    public let discountPrice: Double?
    public let discountPercentage: Double?
    public let earnPoint: Int
    public let sharePoint: Int
    public let flightLegDatas: [FlightLegData]
    public var hasTechnicalStoppage: Bool
    public var isRefundable: String
    public var dealType: FlightDealType?
    
    public var totalPriceText: String {
        return totalPrice.withCommas()
    }
    
    public var discountPriceText: String? {
        return discountPrice?.withCommas()
    }
    
    public var earnPointText: String {
        return earnPoint.withCommas()
    }
    
    public var sharePointText: String {
        return sharePoint.withCommas()
    }
}
