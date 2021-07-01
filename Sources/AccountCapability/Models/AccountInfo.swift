//
//  AccountInfo.swift
//  
//
//  Created by Parth on 01/07/21.
//

import Foundation

public struct AccountInfo: Decodable {
    public let account: Account
    public let transactions: [Transaction]?
    public let atms: [ATM]?
}
