//
//  VMRoomResponse.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 07/07/2021.
//

import Foundation


struct VMRoomResponse: Codable {
    
    var id: String?
    var createdAt: String?
    var name: String?
    var maxOccupancy: Int?
    var isOccupied: Bool?
    
    var isAvailable: String? {
        return isOccupied ?? false ? "Rooom Unavailable" : "Room Available"
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case id
        case createdAt = "created_at"
        case maxOccupancy = "max_occupancy"
        case isOccupied = "is_occupied"
    }
}



