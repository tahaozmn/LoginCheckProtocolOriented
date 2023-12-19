//
//  LoginStorageService.swift
//  LoginProtocolOri
//
//  Created by Taha Özmen on 19.12.2023.
//

import Foundation


protocol LoginStorageService {
    var userAccessTokenKey : String {get}
    func setUserAccessToken(token: String)
    func getUserAccessToken() -> String?
}
