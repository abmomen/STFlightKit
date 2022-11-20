//
//  FlightSearchResponse.swift
//  STFlightKit
//
//  Created by ST-iOS on 11/20/22.
//

import Foundation

struct FlightSearchResponse: Codable {
    let totalRecords: Int
    let searchId, sessionId: String
    let flightRouteType: FlightRouteType
    let flightClass: FlightClass
    let flights: [Flight]
    var filters: FlightFilter
    var filterDeal: FlightSortingOptions?
    
    enum CodingKeys: String, CodingKey {
        case totalRecords, searchId, sessionId, filters, flights
        case flightClass = "class"
        case flightRouteType = "tripType"
        case filterDeal
    }
}

class PlaneCabin: Codable {
    let code, name: String
}

class TimeSlot: Codable {
    let key, value: String
}

class FlightStoppage: Codable {
    let id: Int
    let name: String
}

class FlightWeight: Codable {
    let key, weight: Int
    let unit: String
    let note: String
}

public class FlightLeg: Codable {
    public let searchCode, sequenceCode: String
    public let airlines: AirlineInfo
    public let airlinesCode: String
    public let logo: String
    public let aircraft: String
    public let aircraftCode: String
    public let originName, destinationName: AirportInfo
    public let arrivalDateTime, departureDateTime: DateTime
    public let duration: String
    public let stop: Int
    public let stopSegment: [Airport]
    public let min, dayCount: Int
    public let hiddenStops: Bool
}
