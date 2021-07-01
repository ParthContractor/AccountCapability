import Foundation

final public class AccountCapability: LoadJSONFileData {
    var fileName: String = "data"//provide json filename
    typealias T = AccountInfo//provide custom model type to match with json template

    public func getAccountInfo() -> AccountInfo? {
        return self.loadJsonFileData()
    }
}
