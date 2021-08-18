//
//  MockPeopleViewModel.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 06/08/2021.
//

import XCTest
import RxSwift
@testable import DirectoryApp

class MockPeopleViewModel: BaseViewModel, IPeopleViewModel {
    var isGetPeopleMethodCalled: Bool = false
    var peopleResponses: PublishSubject<[PeopleTableViewCellViewModel]>  = PublishSubject()
    var peopleArray = [PeopleTableViewCellViewModel]()
    
    let peopleRepo: IPeopleRepo?
    required init(peopleRepo: IPeopleRepo) {
        self.peopleRepo = peopleRepo
    }
    
    func getPeople() {
        isGetPeopleMethodCalled = true
        peopleRepo?.getPeople().subscribe(onNext: { res in
            if let peopleRes = res.data {
                self.peopleResponses.onNext(peopleRes.map({return PeopleTableViewCellViewModel(people: $0)
                }))
            }
            else if let apiErr = res.error {
                self.apiError.onNext(apiErr)
                
            }
        },
        
        onError: { [weak self] error in
            self?.isLoading.onNext(false)
            self?.throwableError.onNext(error)
        }).dispose()
        
    }
    

  

}
