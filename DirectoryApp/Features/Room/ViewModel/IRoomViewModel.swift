//
//  IRoomViewModel.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation
import RxSwift

protocol IRoomViewModel: AnyObject {
    var roomResponses: PublishSubject<[RoomCellViewModel]> { get }
    init(roomRepo: IRoomRepo)
    func getRoom()
   
}
