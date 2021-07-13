//
//  ViewModel.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import RxSwift
import RxCocoa

class RoomViewModel: BaseViewModel, IRoomViewModel {
   
    var roomResponses: PublishSubject<[VMRoomResponse]>  = PublishSubject()
    let roomRepo: IRoomRepo
    
    init(roomRepo: IRoomRepo) {
        self.roomRepo = roomRepo
    }
    
    func getRoom() {
        self.isLoading.onNext(true)
        roomRepo.getRoom().subscribe ( onNext: { [weak self] res in
            self?.isLoading.onNext(false)
            if let roomRes = res.data {
                self?.roomResponses.onNext(roomRes)
            }
            else if let apiErr = res.error {
            self?.apiError.onNext(apiErr)
        }
        },
        onError: { [weak self] error in
            self?.isLoading.onNext(false)
            self?.throwableError.onNext(error)
        }

    ).disposed(by: disposeBag)
    
    }
    
    func getRoomFile() {
        self.isLoading.onNext(true)
        roomRepo.getRoomFile().subscribe ( onNext: { [weak self] res in
            self?.isLoading.onNext(false)
//            if let roomRes = res.data {
//                self?.roomResponses.onNext(roomRes)
//                print(roomRes.count)
//              
//                
//            }
//            else if let apiErr = res.error {
//            self?.apiError.onNext(apiErr)
//        }
        },
        onError: { [weak self] error in
            self?.isLoading.onNext(false)
            self?.throwableError.onNext(error)
        }

    ).disposed(by: disposeBag)
    }
}
