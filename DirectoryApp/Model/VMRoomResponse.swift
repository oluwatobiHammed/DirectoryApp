//
//  VMRoomResponse.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 07/07/2021.
//

import Foundation


struct VMRoomResponse: Codable {
    
    var id: String?
    var created_at: String?
    var name: String?
    var max_occupancy: Int?
    var is_occupied: Bool?
    
    
//    enum CodingKeys: String, CodingKey {
//        case name
//        case id
//        case createdAt = "created_at"
//        case maxOccupancy = "max_occupancy"
//        case isOccupied = "is_occupied"
//    }
}



