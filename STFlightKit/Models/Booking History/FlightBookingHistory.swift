//
//  FlightBookingHistory.swift
//  STFlightKit
//
//  Created by ST-iOS on 11/20/22.
//

import STCoreKit

enum FlightBookingStatus: String, Codable {
    case pending = "Pending"
    case booked = "Booked"
    case issued = "Issued"
    case declined = "Declined"
    case canceled = "Cancelled"
    case completed = "Completed"
    
    init(from decoder: Decoder) throws {
        let stringValue = try decoder.singleValueContainer().decode(String.self)
        let capitalizedValue = stringValue.capitalized
        self = FlightBookingStatus(rawValue: capitalizedValue) ?? .pending
    }
}

enum PaymentStatus: String, Codable {
    case unpaid = "Unpaid"
    case paid = "Paid"
    
    init(from decoder: Decoder) throws {
        let stringValue = try decoder.singleValueContainer().decode(String.self)
        let capitalizedValue = stringValue.capitalized
        //self = PaymentStatus(rawValue: capitalizedValue) ?? .unknown
        self = PaymentStatus(rawValue: capitalizedValue) ?? .unpaid
    }
}

struct FlightBookingHistoryResponse: Codable {
    let data: [FlightBookingHistory]?
    let offset, count, limit: Int
}

class FlightBookingHistory: Codable {
    let actualAmount: Double?
    let airFareRules: [AirFareRule]
    let airlineResCode: String?
    let baggageInfo: [BaggageInfo]?
    
    let bookingCode: String?
    let searchId: String?
    let bookingCurrency: String
    let bookingStatus: FlightBookingStatus

    let eTicket: String?
    let flight: [FlightRouteInfo]
    let gatewayAmount: Double?
    
    let gatewayCurrency: String?
    let paymentStatus: PaymentStatus
    let pnrCode: String?

    var priceBreakdown: FlightPriceBreakdown
    let covidAmount: Double?
    let travelInsuranceAmount: Double?
    
    let searchParams: FlightSearchParams
    let searchParamDetails: [FlightSearchParamDetail]
    
    let segments: [FlightSegment]
    let points: Point
    let travellers: [TravellerInfo]
    
    let luggageAmount: Double?
    let advanceIncomeTax: Double?
    let baggage: Baggage?
    let convenienceFee: Double?
    
    let isModified: Bool?
    let isVoidable: Bool?
    let isRefundable: Bool?
    let isReissueable: Bool?
    let modifyHistory: [ModifyHistory]?
}

struct ModifyHistory: Codable {
    let modificationType, refundSearchID, bookingCode, automationType: String?
    let eTickets: String?
    let airlineRefundCharge, stFee, totalFee, purchasePrice: Int?
    let totalRefundAmount: Int?
    
    enum CodingKeys: String, CodingKey {
        case modificationType
        case refundSearchID = "refundSearchId"
        case bookingCode, automationType, eTickets, airlineRefundCharge, stFee, totalFee, purchasePrice, totalRefundAmount
    }
}

//MARK:- Baggage
struct Baggage: Codable {
    let basic: [AirportDetail]?
    let extra: [ExtraBaggageDetail]?
}

struct AirportDetail: Codable {
    let origin: AirportDetailInfo?
    let destination: AirportDetailInfo?
    let baggage: [BaggageDetail]?
}

struct AirportDetailInfo: Codable {
    let code: String?
    let country: String?
    let city: String?
    let airport: String?
}

struct BaggageDetail: Codable {
    let weight: Double?
    let name: String?
    let unit: String?
    let type: String?
}

struct ExtraBaggageDetail: Codable {
    let route: String?
    let details: [ExtraBaggageDetailInfo]?
}

struct ExtraBaggageDetailInfo: Codable {
    let currency: String?
    let weight: String?
    let name: String?
    let price: Double?
}

class BaggageInfo: Codable {
    let type: String
    let adult: String?
    let child: String?
    let infant: String?
}

//MARK:- airFareRules
class AirFareRule: Codable {
    let destination: String
    let destinationCode: String
    let origin: String
    let originCode: String
    let policy: AirFarePolicy
}

class AirFarePolicy: Codable {
    let header: [PolicyNote]
    let rules: [PolicyNote]
}

class PolicyNote: Codable {
    let code: Int?
    let text: String
    let type: String
}

//MARK:- flight
class FlightRouteInfo: Codable {
    let departureDateTime: DateTime
    let destinationName: AirportInfo?
    let originName: AirportInfo?
}

class FlightSearchParamDetail: Codable {
    let departureDateTime: String
    let destination: String
    let origin: String
    let sequence: Int
}

class FlightSearchParams: Codable {
    let tripType: TripType
    let adult: Int?
    let airlines: String?
    let child: Int?
    let classType: String?
    let currency: String?
    let deviceType: String?
    let flightType: String?
    let infant: Int?
    let nextLink: String?
    let preferredAirlines: String?
    let stop: String?
    
    enum CodingKeys: String, CodingKey {
        case adult
        case airlines
        case child
        case classType = "class"
        case currency
        case deviceType
        case flightType
        case infant
        case nextLink
        case preferredAirlines
        case stop
        case tripType
    }
}


public class FlightSegment: Codable {
    public let segmentDetails: [FlightSegmentDetail]
    public let type: String
    
    enum CodingKeys: String, CodingKey {
        case segmentDetails = "segment"
        case type
    }
}

public class FlightSegmentDetail: Codable {
    public let searchCode: String
    public let sequenceCode: String
    
    public let aircraft: String
    public let aircraftCode: String
    public let airlines: AirlineInfo
    public let airlinesCode: String
    public let baggageUnit: String
    public let baggageWeight: Int
    public let cabin: String
    public let dayCount: Int
    public let logo: String?
    
    public let destinationCode: String
    public let destinationName: AirportInfo
    public let arrivalDateTime: DateTime
    
    public let originCode: String
    public let originName: AirportInfo
    public let departureDateTime: DateTime
    
    public let duration: String
    public let transitTime: String
    
    //Optioanal
    public let flightNumber: String?
    public let seatsRemaining: Int?

    public let hiddenStop: FlightHiddenStop?
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        searchCode = try container.decode(String.self, forKey: .searchCode)
        sequenceCode = try container.decode(String.self, forKey: .sequenceCode)
        aircraft = try container.decode(String.self, forKey: .aircraft)
        aircraftCode = try container.decode(String.self, forKey: .aircraftCode)
        airlines =  try container.decode(AirlineInfo.self, forKey: .airlines)
        airlinesCode = try container.decode(String.self, forKey: .airlinesCode)
        baggageUnit = try container.decode(String.self, forKey: .baggageUnit)
        baggageWeight = try container.decode(Int.self, forKey: .baggageWeight)
        cabin = try container.decode(String.self, forKey: .cabin)
        dayCount = try container.decode(Int.self, forKey: .dayCount)
        
        logo = try? container.decode(String.self, forKey: .logo)
        
        destinationCode = try container.decode(String.self, forKey: .destinationCode)
        destinationName = try container.decode(AirportInfo.self, forKey: .destinationName)
        arrivalDateTime = try container.decode(DateTime.self, forKey: .arrivalDateTime)
        
        originCode = try container.decode(String.self, forKey: .originCode)
        originName = try container.decode(AirportInfo.self, forKey: .originName)
        departureDateTime = try container.decode(DateTime.self, forKey: .departureDateTime)
        
        duration = try container.decode(String.self, forKey: .duration)
        transitTime = try container.decode(String.self, forKey: .transitTime)
        
        flightNumber = try? container.decodeIfPresent(String.self, forKey: .flightNumber)
        seatsRemaining = try? container.decodeIfPresent(Int.self, forKey: .seatsRemaining)

        hiddenStop = try? container.decodeIfPresent(FlightHiddenStop.self, forKey: .hiddenStop)
    }
}

public struct FlightHiddenStop: Codable {
    public let city: String
    public let airport: String
    public let code: String
}

public struct Covid19TestInfo: Codable {
    public let address: String?
    public let isHomeCollection: Bool?
    public let option: String?
    public let customerAddress: String?
    public let discountPrice: Double?
    public let center: String?
}

public class TravellerInfo: Codable {
    public let code: String
    public let title: String
    public let givenName: String
    public let surName: String
    public let travellerType: TravellerType?
    public let gender: String
    public let dateOfBirth: String
    public let email: String
    public let passportNumber: String
    public let passportExpireDate: String
    public let mobileNumber: String
    public let nationality: String
    
    public let frequentFlyerNumber: String?
    public var passportCopy: String?
    public var visaCopy: String?

    public let address1: String
    public let primaryContact: String
    public let covid: Covid19TestInfo?
    

    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        title = try container.decode(String.self, forKey: .title)
        givenName = try container.decode(String.self, forKey: .givenName)
        surName = try container.decode(String.self, forKey: .surName)
        travellerType = try? container.decode(TravellerType.self, forKey: .travellerType)
        gender = try container.decode(String.self, forKey: .gender)
        dateOfBirth = try container.decode(String.self, forKey: .dateOfBirth)

        email = try container.decode(String.self, forKey: .email)
        passportNumber = try container.decode(String.self, forKey: .passportNumber)
        passportExpireDate = try container.decode(String.self, forKey: .passportExpireDate)
        mobileNumber = try container.decode(String.self, forKey: .mobileNumber)
        nationality = try container.decode(String.self, forKey: .nationality)
        
        frequentFlyerNumber = try? container.decodeIfPresent(String.self, forKey: .frequentFlyerNumber)
        passportCopy = try? container.decodeIfPresent(String.self, forKey: .passportCopy)
        visaCopy = try? container.decodeIfPresent(String.self, forKey: .visaCopy)
        
        address1 = try container.decodeIfPresent(String.self, forKey: .address1) ?? ""
        primaryContact = try container.decodeIfPresent(String.self, forKey: .primaryContact) ?? ""
        covid = try container.decodeIfPresent(Covid19TestInfo.self, forKey: .covid)
    }
}
