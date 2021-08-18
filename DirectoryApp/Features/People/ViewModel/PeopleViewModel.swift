//
//  PeopleViewModelImpl.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//
import RxSwift
import RxCocoa


class PeopleViewModel: BaseViewModel, IPeopleViewModel {
    
    var peopleResponses: PublishSubject<[PeopleTableViewCellViewModel]>  = PublishSubject()
    let peopleRepo: IPeopleRepo
    
    
    required init(peopleRepo: IPeopleRepo) {
        self.peopleRepo = peopleRepo
    }
    
    func getPeople() {
        self.isLoading.onNext(true)
        peopleRepo.getPeople().subscribe ( onNext: { [weak self]  in
            self?.isLoading.onNext(false)
            if let peopleRes = $0.data {
                self?.peopleResponses.onNext(peopleRes.map({return PeopleTableViewCellViewModel(people: $0)
                }))
            }
            else if let apiErr = $0.error {
                self?.apiError.onNext(apiErr)
                
            }
        },
        onError: { [weak self] error in
            self?.isLoading.onNext(false)
            self?.throwableError.onNext(error)
        }).disposed(by: disposeBag)
        
    }
}
