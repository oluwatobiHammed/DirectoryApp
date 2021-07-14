//
//  VMUrlRouteProtocol.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation
import RxSwift

protocol VMUrlRouteProtocol {
    //MARK: function for URLSession takes
    func makeAPIRequestObservable<T: Codable>(responseType: T.Type, url: URL, method: Method,params: [String : String]?) -> Observable<T>
}
