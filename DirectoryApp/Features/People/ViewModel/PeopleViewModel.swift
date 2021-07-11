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
        self.isLoading.onNext(true)
        peopleRepo.getPeople().subscribe ( onNext: { [weak self] res in
            self?.isLoading.onNext(false)
            if let peopleRes = res.data {
                self?.peopleResponses.onNext(peopleRes)
            }
            else if let apiErr = res.error {
                self?.apiError.onNext(apiErr)
            }
        },
        onError: { [weak self] error in
            self?.isLoading.onNext(false)
            self?.throwableError.onNext(error)
        }).disposed(by: disposeBag)
        
    }
}
