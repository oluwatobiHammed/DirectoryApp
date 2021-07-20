//
//  PeopleRouting.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 07/07/2021.
//

import Foundation
import RxSwift

class VMRoute:  VMURLRoute, VMRouteProtocol  {
    func getRoomFile() -> Observable<ApiResponse<[VMRoomResponse]>> {
        return Bundle.main.decode(ApiResponse<[VMRoomResponse]>.self, from: "response.txt")
    }
    
    
    func getRoom() -> Observable<ApiResponse<[VMRoomResponse]>> {
        return makeAPIRequestObservable(responseType: ApiResponse<[VMRoomResponse]>.self, url: RemoteApiConstants.Endpoints.getRoom.url, method: .Get, params: [:])
    }
    
    func getPeople() -> Observable<ApiResponse<[VMPeopleResponse]>> {
        return makeAPIRequestObservable(responseType: ApiResponse<[VMPeopleResponse]>.self, url: RemoteApiConstants.Endpoints.getPeople.url, method: .Get, params: [:])
    }
    
    

}
