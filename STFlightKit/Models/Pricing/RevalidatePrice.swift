//
//  RevalidatePrice.swift
//  STFlightKit
//
//  Created by ST-iOS on 11/20/22.
//

import STCoreKit

struct RevalidatePrice {
    struct Request: Codable {
        var searchId: String
        var sequenceCode: String
        var sessionId: String
        
        var params: [String: Any] {
            var params = [String: Any]()
            params["searchId"] = searchId
            params["sessionId"] = sessionId
            params["sequenceCode"] = sequenceCode
            return params
        }
    }

    // MARK: - Response
    struct Response: Codable {
        let points: Points
        let priceBreakdown: FlightPriceBreakdown
    }
}
