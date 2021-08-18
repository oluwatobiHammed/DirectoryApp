//
//  MockRoomViewModel.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 08/08/2021.
//


import XCTest
import RxSwift
@testable import DirectoryApp

class MockRoomViewModel: BaseViewModel, IRoomViewModel {
    

    
    var isGetPeopleMethodCalled: Bool = false
    var roomResponses: PublishSubject<[RoomCellViewModel]>  = PublishSubject()
    var peopleArray = [PeopleTableViewCellViewModel]()
    
    let roomRepo: IRoomRepo?
    required init(roomRepo: IRoomRepo) {
        self.roomRepo = roomRepo
    }
    
   
    func getRoom() {
        isGetPeopleMethodCalled = true
        roomRepo?.getRoom().subscribe({ res in
            if let peopleRes = res.element?.data {
                self.roomResponses.onNext(peopleRes.map({return RoomCellViewModel(room: $0)
                }))
            }
        }).dispose()
    }

  

}

