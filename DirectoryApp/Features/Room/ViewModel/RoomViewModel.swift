//
//  ViewModel.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import RxSwift
import RxCocoa

class RoomViewModel: BaseViewModel, IRoomViewModel {
    
    var roomResponse: PublishSubject<VMRoomResponse>  = PublishSubject()
    var roomResponses: PublishSubject<[VMRoomResponse]>  = PublishSubject()
    let roomRepo: IRoomRepo
    
    
    init(roomRepo: IRoomRepo) {
        self.roomRepo = roomRepo
    }
    
    func getRoom() {
        roomRepo.getRoom().subscribe ( onNext: { [weak self] res in
            if let roomRes = res.data {
                self?.roomResponses.onNext(roomRes)
                roomRes.forEach { resroom in
                    //if let rooms = resroom {
                    print(resroom.id)
                   // }
                }
                
            }
            else if let apiErr = res.error {
            self?.apiError.onNext(apiErr)
        }
        },
        onError: { [weak self] error in
            self?.throwableError.onNext(error)
        }

    ).disposed(by: disposeBag)
    
    }
}
