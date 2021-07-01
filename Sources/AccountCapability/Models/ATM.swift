//
//  ATM.swift
//  
//
//  Created by Parth on 01/07/21.
//

import Foundation

public struct ATM: Decodable {
    public let id: String
    public let name: String
    public let address: String
    public let location: Location
}
