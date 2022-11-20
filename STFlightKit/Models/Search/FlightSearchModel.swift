//
//  FlightSearchModel.swift
//  STFlightKit
//
//  Created by ST-iOS on 11/20/22.
//

import Foundation

enum FlightSearchCellOption {
    case routeType
    case airport
    case date
    case travellerClass
    case addCity
    case searchButton
    case explore
    case promotionalImage
}

struct FlightSearchInfo {
    let departure: Airport?
    let arrival: Airport?
    let date: Date?
}

enum FlightScheduledType: Int {
    case departure
    case arrival
}
