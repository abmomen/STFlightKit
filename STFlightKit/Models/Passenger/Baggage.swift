//
//  Baggage.swift
//  STFlightKit
//
//  Created by ST-iOS on 11/20/22.
//

import STCoreKit

struct BaggageResponse: Codable {
    let isPerPerson, isLuggageOptional, wholeFlight: Bool?
    var wholeFlightOptions: [Option]?
    var routeOptions: [RouteOption]?
    
    struct RouteOption: Codable {
        let origin, destination: String?
        var options: [Option]?
    }
    
    struct Option: Codable, Hashable {
        var travellerType: TType?
        var code: String?
        let quantity: Int?
        let details: String?
        let amount: Double?
        let currency: Currency
        
        enum TType: String, Codable {
            case adt = "ADT"
            case chd = "CHD"
            case inf = "INF"
        }
    }
}
