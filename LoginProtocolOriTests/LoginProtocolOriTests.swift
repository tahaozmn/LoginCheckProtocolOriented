//
//  LoginProtocolOriTests.swift
//  LoginProtocolOriTests
//
//  Created by Taha Özmen on 19.12.2023.
//

import XCTest
@testable import LoginProtocolOri

final class LoginProtocolOriTests: XCTestCase {
    
    private var viewModel : RootViewModel!
    private var loginStorageService : MockLoginStorageService!
    private var output : MockRootViewModelOutput!

    override func setUpWithError() throws {
        
        loginStorageService = MockLoginStorageService()
        viewModel = RootViewModel(loginStorageService: loginStorageService)
        output = MockRootViewModelOutput()
        
        viewModel.output = output
        
    }

    override func tearDownWithError() throws {
        viewModel = nil
        loginStorageService = nil
    }

    func testShowLogin_whenLoginStorageReturnsEmptyUserAccessToken() throws {
        loginStorageService.storage = [:]
        viewModel.checkLogin()
        
        XCTAssertEqual(output.check.first, .login)
    }
    
    func testShowMainApp_whenLoginStorageReturnsEmptyString() throws {
        loginStorageService.storage["ACCESS_TOKEN"] = ""
        viewModel.checkLogin()
        
        XCTAssertEqual(output.check.first, .login )
    }
    
    func testShowMainApp_whenLoginStorageReturnsUserAccessToken() throws {
        loginStorageService.storage["ACCESS_TOKEN"] = "123123VBNCVBN345345"
        viewModel.checkLogin()
        
        XCTAssertEqual(output.check.first, .mainApp)
    }

   
    class MockLoginStorageService : LoginStorageService {
        
        var userAccessTokenKey: String {
            return "ACCESS_TOKEN"
        }
        
        var storage : [String : String] = [:]
        
        func setUserAccessToken(token: String) {
            storage[userAccessTokenKey] = token
        }
        
        func getUserAccessToken() -> String? {
            return storage[userAccessTokenKey]
        }
    }

}

class MockRootViewModelOutput : RootViewModelOutput {
    
    enum Check {
        case login
        case mainApp
    }
    
    var check : [Check] = []
    
    func showLogin() {
        check.append(.login)
    }
    
    func showMainApp() {
        check.append(.mainApp)
    }
    
    
}
