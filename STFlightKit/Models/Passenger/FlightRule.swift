//
//  FlightRule.swift
//  STFlightKit
//
//  Created by ST-iOS on 11/20/22.
//

import Foundation

// MARK: - FlightRuleResponse
class FlightRuleResponse: Codable {
    let refundPolicies: [RefundPolicy?]?
    let baggages: [FlightBaggage]?
    let fareDetails: String?
    
    enum CodingKeys: String, CodingKey {
        case refundPolicies = "airFareRules"
        case baggages, fareDetails
    }
}

// MARK: - RefundPolicy/AirFareRule
class RefundPolicy: Codable {
    let type: String
    let rules: [RefundPolicyRule]
}

// MARK: - RefundPolicyRule
class RefundPolicyRule: Codable {
//    let code: Int
    let type, text: String
}

// MARK: - Baggage
class FlightBaggage: Codable {
    let type: String
    let adult: String?
    let child, infant: String?
}
