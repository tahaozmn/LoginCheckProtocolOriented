//
//  RootViewModel.swift
//  LoginProtocolOri
//
//  Created by Taha Özmen on 19.12.2023.
//

import Foundation


class RootViewModel {
    
    
    private let loginStorageService : LoginStorageService
    
    weak var output : RootViewModelOutput?
    
    init(loginStorageService: LoginStorageService) {
        self.loginStorageService = loginStorageService
    }
    
    
    func checkLogin() {
        if let accessToken = loginStorageService.getUserAccessToken(), !accessToken.isEmpty {
            //showMainApp()
            output?.showMainApp()
        } else {
            //showLogin()
            output?.showLogin()
        }
    }

    
}
