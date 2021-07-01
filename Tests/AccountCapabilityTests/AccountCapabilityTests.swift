    import XCTest
    @testable import AccountCapability

    final class AccountCapabilityTests: XCTestCase, LoadJSONFileData {
        var fileName: String = "data"//provide json filename
        var strRemote: String = "https://www.dropbox.com/s/tewg9b71x0wrou9/data.json?dl=1"//provide remote URL string
        typealias T = AccountInfo//provide custom model type to match with json template
        let accountCap = AccountCapability()

        // MARK: - Load JSON Test Cases
        func testLoadJSONFileData() {
            if let jsonData = self.loadJsonFileData(){
                XCTAssertNotNil(jsonData)
            }
            else{
                XCTFail("JSON could not be loaded")
            }
        }
        
        func testAccountCapability() {
            if let accountInfo = accountCap.getCachedAccountInfo(){
                XCTAssertNotNil(accountInfo)
                XCTAssertEqual(accountInfo.account.accountName, "Complete Access")
                XCTAssertEqual(accountInfo.account.accountNumber, "062005 1709 5888")
            }
            else{
                XCTFail("JSON could not be loaded")
            }
        }
        
        func testAccountTransactions() {
            if let accountInfo = accountCap.getCachedAccountInfo(){
                XCTAssertNotNil(accountInfo)
                XCTAssertEqual(accountInfo.transactions?.count, 13)
            }
            else{
                XCTFail("JSON could not be loaded")
            }
        }
        
        func testAccountPendingTransactions() {
            if let accountInfo = accountCap.getCachedAccountInfo(){
                XCTAssertNotNil(accountInfo)
                XCTAssertEqual(accountInfo.pending?.count, 2)
            }
            else{
                XCTFail("JSON could not be loaded")
            }
        }
        
        func testAccountAtms() {
            if let accountInfo = accountCap.getCachedAccountInfo(){
                XCTAssertNotNil(accountInfo)
                XCTAssertEqual(accountInfo.atms?.count, 2)
            }
            else{
                XCTFail("JSON could not be loaded")
            }
        }

    }
