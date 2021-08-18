//
//  RemoteApiConstants.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

//import Foundation
//
//struct RemoteApiConstants {
//    fileprivate static let BASE_URL = ApplicationUtility.applicationProperties.baseUrl+"raw/"
//
//    // MARK:- ROOM APIs
//    static let ROOM_URL = "https://pastebin.com/raw/TGnC5c8e"
//
//
//    // MARK:- PEOPLE APIs
//    static let PEOPLE_URL = "\(BASE_URL)kg02uve4"
//
//
//
//
//
//}
import Foundation

class RemoteApiConstants {
    
    enum Endpoints {
        fileprivate static let BASE_URL = ApplicationUtility.applicationProperties.baseUrl+"raw/"
        case getRoom
        case getPeople
       
        var stringValue: String {
            switch self {
                
            case .getRoom:
                return     Endpoints.BASE_URL + "TGnC5c8e"
            case .getPeople:
                return    Endpoints.BASE_URL + "kg02uve4"
            
            }
        }
        
    }
    
}


