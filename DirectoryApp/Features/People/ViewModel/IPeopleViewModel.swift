//
//  IPeopleViewModel.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation
import RxSwift

protocol IPeopleViewModel {
    var peopleResponse: PublishSubject<VMPeopleResponse> { get }
    var peopleResponses: PublishSubject<[VMPeopleResponse]> { get }
    func getPeople()
   
}
