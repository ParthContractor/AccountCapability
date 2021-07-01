//
//  Account.swift
//  
//
//  Created by Parth on 01/07/21.
//

import Foundation

public struct Account: Decodable {
    public let accountName: String
    public let accountNumber: String
    public let available: Double
    public let balance: Double
}
