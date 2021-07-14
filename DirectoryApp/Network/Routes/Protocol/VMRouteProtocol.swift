//
//  VMRouterProtocol.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation
import RxSwift

protocol VMRouteProtocol {
    
    func getRoom() -> Observable<ApiResponse<[VMRoomResponse]>>
    func getRoomFile() -> Observable<ApiResponse<[VMRoomResponse]>>
    func getPeople() -> Observable<ApiResponse<[VMPeopleResponse]>>
    
}
