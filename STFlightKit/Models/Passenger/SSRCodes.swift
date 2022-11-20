//
//  SSRCodes.swift
//  STFlightKit
//
//  Created by ST-iOS on 11/20/22.
//

import Foundation

// MARK: - Response
struct SSRType: Codable {
    let type: String
    let ssr: [SSR]
}

// MARK: - SSR
struct SSR: Codable {
    let code, name: String
}
