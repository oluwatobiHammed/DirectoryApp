//
//  VMUrlRouteProtocol.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation
import Alamofire
import RxSwift

protocol VMUrlRouteProtocol {
//    func makeAPIRequest<T: Codable>(responseType: T.Type, url: String, method: HTTPMethod, params: [String : Any]?, encoding: ParameterEncoding,
//                                    successHandler: @escaping (T) -> Void, errorHandler: @escaping (Error) -> Void)
    
    //MARK: function for URLSession takes
    func makeAPIRequestObservable<T: Codable>(responseType: T.Type, url: URL, method: Method,params: [String : String]?) -> Observable<T>
}
