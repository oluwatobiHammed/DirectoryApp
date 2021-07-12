//
//  IRoomRepo.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation

import Foundation
import RxSwift


 protocol IRoomRepo {
    func getRoom() -> Observable<ApiResponse<[VMRoomResponse]>>
    func getRoomFile() -> Observable<[VMRoomResponse]>
}
