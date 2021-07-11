//
//  IRoomViewModel.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation
import RxSwift

protocol IRoomViewModel {
    var roomResponses: PublishSubject<[VMRoomResponse]> { get }
    func getRoom()
   
}
