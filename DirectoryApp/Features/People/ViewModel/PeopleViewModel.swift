//
//  PeopleViewModelImpl.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//
import RxSwift
import RxCocoa

class PeopleViewModel: BaseViewModel, IPeopleViewModel {
    
    var peopleResponse: PublishSubject<VMPeopleResponse>  = PublishSubject()
    var peopleResponses: PublishSubject<[VMPeopleResponse]>  = PublishSubject()
    let peopleRepo: IPeopleRepo
    
    
    init(peopleRepo: IPeopleRepo) {
        self.peopleRepo = peopleRepo
    }
    
    func getPeople() {
        peopleRepo.getPeople().subscribe ( onNext: { [weak self] res in
            if let peopleRes = res.data {
                self?.peopleResponses.onNext(peopleRes)
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
