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

class MockVMRoute: VMRouteProtocol  {
    
    
    private let baseNetwork: BaseNetWorkProtocol!
    private var timeOut : TimeInterval = 30
    private lazy var urlSession: URLSessionConfiguration = {
        urlSession.requestCachePolicy = .useProtocolCachePolicy
        urlSession.timeoutIntervalForResource = timeOut
        urlSession.timeoutIntervalForRequest = timeOut
        return urlSession
    }()

init(baseNetwork: BaseNetWorkProtocol, urlSession: URLSessionConfiguration = .default) {
    self.baseNetwork = baseNetwork
    self.urlSession = urlSession
    
}
    func getPeople(urlString : String) -> Observable<ApiResponse<[VMPeopleResponse]>> {
        return baseNetwork.makeAPIRequestObservable(responseType: ApiResponse<[VMPeopleResponse]>.self, url: urlString, urlSession: .default, method: .get, params: [:], encoding: URLEncoding.default)
        
    }
    
    func getRoom(urlString : String) -> Observable<ApiResponse<[VMRoomResponse]>> {
        return baseNetwork.makeAPIRequestObservable(responseType: ApiResponse<[VMRoomResponse]>.self, url: urlString, urlSession: .default, method: .get, params: [:], encoding: URLEncoding.default)
    }
    
    
    
    
}
