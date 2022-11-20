//
//  FlightPriceIndicatorModels.swift
//  STFlightKit
//
//  Created by ST-iOS on 11/20/22.
//

import Foundation

// MARK: - Response
struct FlightPriceIndicatorResponse: Codable {
    let max, min: MinMaxFlightPriceIndicator?
    let fare: [DateFlightPriceIndicator]
}

// MARK: - Fare
struct DateFlightPriceIndicator: Codable {
    let date: String
    let direct, nonDirect: Double
}

// MARK: - Max
struct MinMaxFlightPriceIndicator: Codable {
    let direct, nonDirect: Double
}
