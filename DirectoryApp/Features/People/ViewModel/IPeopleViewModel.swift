//
//  IPeopleViewModel.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation
import RxSwift

protocol IPeopleViewModel {
    var peopleResponses: PublishSubject<[PeopleTableViewCellViewModel]> { get }
    func getPeople()
   
}
