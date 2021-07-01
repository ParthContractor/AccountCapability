//
//  Transaction.swift
//  
//
//  Created by Parth on 01/07/21.
//

import Foundation

public struct Transaction: Decodable {
    public let id: String
    public let effectiveDate: String
    public let description: String?
    public let amount: Double
    public let atmId: String?
}
