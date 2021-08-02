//
//  PeopleRouting.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 07/07/2021.
//

import Foundation
import RxSwift
import Alamofire

class VMRoute: VMRouteProtocol  {
        private let baseNetwork:  BaseNetWorkProtocol
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
    
    func getRoom(urlString: String) -> Observable<ApiResponse<[VMRoomResponse]>> {
        return baseNetwork.makeAPIRequestObservable(responseType: ApiResponse<[VMRoomResponse]>.self, url: urlString, urlSession: urlSession, method: .get, params: [:], encoding: URLEncoding.default)
    }
    
    func getPeople(urlString: String) -> Observable<ApiResponse<[VMPeopleResponse]>> {
        return baseNetwork.makeAPIRequestObservable(responseType: ApiResponse<[VMPeopleResponse]>.self, url: urlString, urlSession: urlSession, method: .get, params: [:], encoding: URLEncoding.default)
    }
    
    

}
