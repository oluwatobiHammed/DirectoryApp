//
//  MockVMRoute.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 29/07/2021.
//

import XCTest
import RxSwift
import RxAlamofire
import Alamofire
@testable import DirectoryApp

class MockVMRoute:  MockPeopleNetwork, VMRouteProtocol  {
    
    
    
    func getPeople(urlString : String) -> Observable<ApiResponse<[VMPeopleResponse]>> {
        return makeAPIRequestObservable(responseType: ApiResponse<[VMPeopleResponse]>.self, url: urlString, urlSession: .default, method: .get, params: [:], encoding: URLEncoding.default)
        
    }
    
    func getRoom(urlString : String) -> Observable<ApiResponse<[VMRoomResponse]>> {
        return makeAPIRequestObservable(responseType: ApiResponse<[VMRoomResponse]>.self, url: urlString, urlSession: .default, method: .get, params: [:], encoding: URLEncoding.default)
    }
    
    
    
    
}
