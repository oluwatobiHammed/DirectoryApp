//
//  PeopleRouting.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 07/07/2021.
//

import Foundation
import Alamofire
import RxSwift

class VMRoute:  VMURLRoute, VMRouteProtocol  {
    func getRoomFile() -> Observable<ApiResponse<[VMRoomResponse]>> {
        return Bundle.main.decode(ApiResponse<[VMRoomResponse]>.self, from: "response.txt")
    }
    
    var requestObservable = VMURLRoute(config: .default)
    func getRoom() -> Observable<ApiResponse<[VMRoomResponse]>> {
        return requestObservable.makeAPIRequestObservable(responseType: ApiResponse<[VMRoomResponse]>.self, url: RemoteApiConstants.Endpoints.getRoom.url, method: .Get, params: [:])
    }
    
    func getPeople() -> Observable<ApiResponse<[VMPeopleResponse]>> {
        return requestObservable.makeAPIRequestObservable(responseType: ApiResponse<[VMPeopleResponse]>.self, url: RemoteApiConstants.Endpoints.getPeople.url, method: .Get, params: [:])
    }
    
    

}
