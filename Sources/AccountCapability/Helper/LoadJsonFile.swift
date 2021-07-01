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
    var strRemote: String { get set }
    func loadJsonFileData() -> T?
    func loadRemoteData() -> T?
}

//default implementation is also provided for loading json file content and returning a valid model array
//If something goes in loadJsonFileData then it will return log error with Data decoding failure and return nil because retrun type has possibility of having nil value
extension LoadJSONFileData {
    func loadJsonFileData() -> T? {
        if let url = Bundle.module.url(forResource: fileName, withExtension: "json")  {
            return loadData(url)
        }
        return nil
    }
    
    func loadRemoteData() -> T? {
        if let url = URL(string: "https://www.dropbox.com/s/tewg9b71x0wrou9/data.json?dl=1") {
            return loadData(url)
        }
        return nil
    }
    
    private func loadData(_ url: URL) -> T? {
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

}
