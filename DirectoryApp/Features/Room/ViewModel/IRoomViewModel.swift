//
//  IRoomViewModel.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation
import RxSwift

protocol IRoomViewModel {
    var roomResponses: PublishSubject<[RoomCellViewModel]> { get }
    func getRoom()
    //func getRoomFile()
   
}
