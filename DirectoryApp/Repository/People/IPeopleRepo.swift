//
//  IPeopleRepo.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation
import RxSwift


 protocol IPeopleRepo {
    func getPeople() -> Observable<ApiResponse<[VMPeopleResponse]>>
}
