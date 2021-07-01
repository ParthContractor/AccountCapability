    import XCTest
    @testable import AccountCapability

    final class AccountCapabilityTests: XCTestCase, LoadJSONFileData {
        var fileName: String = "data"//provide json filename
        typealias T = AccountInfo//provide custom model type to match with json template

        func testLoadJSONFileData() {
            if let jsonData = self.loadJsonFileData(){
                XCTAssertNotNil(jsonData)
            }
            else{
                XCTFail("JSON could not be loaded")
            }
        }
        
        func testAccountCapability() {
            let accountCap = AccountCapability()
            
            if let accountInfo = accountCap.getAccountInfo(){
                XCTAssertNotNil(accountInfo)
                XCTAssertEqual(accountInfo.account.accountName, "Complete Access")
                XCTAssertEqual(accountInfo.account.accountNumber, "062005 1709 5888")
            }
            else{
                XCTFail("JSON could not be loaded")
            }
        }
    }
