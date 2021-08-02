//
//  VMRouterProtocol.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation
import RxSwift

protocol VMRouteProtocol {
    
    func getRoom(urlString: String) -> Observable<ApiResponse<[VMRoomResponse]>>
    func getPeople(urlString: String) -> Observable<ApiResponse<[VMPeopleResponse]>>
    
}
