import Foundation

final public class AccountCapability: LoadJSONFileData {
    var strRemote: String = "https://www.dropbox.com/s/tewg9b71x0wrou9/data.json?dl=1"//provide remote URL string
    var fileName: String = "data"//provide json filename
    typealias T = AccountInfo//provide custom model type to match with json template

    public func getCachedAccountInfo() -> AccountInfo? {
        return self.loadJsonFileData()
    }
    
    public func getRemoteAccountInfo() -> AccountInfo? {
        return self.loadRemoteData()
    }
}
