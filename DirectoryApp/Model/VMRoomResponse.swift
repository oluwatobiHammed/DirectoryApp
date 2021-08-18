//
//  VMRoomResponse.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 07/07/2021.
//

import Foundation


struct VMRoomResponse: Codable {
    
    let id, createdAt, name: String?
    var maxOccupancy: Int?
    var isOccupied: Bool? = false
    
    enum CodingKeys: String, CodingKey {
        case name, id
        case createdAt = "created_at"
        case maxOccupancy = "max_occupancy"
        case isOccupied = "is_occupied"
    }
}



