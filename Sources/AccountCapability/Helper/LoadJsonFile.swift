//
//  LoadJsonFile.swift
//  
//
//  Created by Parth on 01/07/21.
//

import Foundation

//protocol defined for loading json file
//it could be reused because filename needs to be provided by client who implements this protocol
//Also custom type(it could be custom model object type) is generic which needs to be provided by client who implements this protocol
protocol LoadJSONFileData {
    associatedtype T: Decodable
    var fileName: String { get set }
    func loadJsonFileData() -> T?
}

//default implementation is also provided for loading json file content and returning a valid model array
//If something goes in loadJsonFileData then it will return log error with Data decoding failure and return nil because retrun type has possibility of having nil value
extension LoadJSONFileData {
    func loadJsonFileData() -> T? {
        if let url = Bundle.module.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data)
                return jsonData
            } catch {
                print("Data decoding failure:\(error)")
                return nil
            }
        }
        return nil
    }
}
