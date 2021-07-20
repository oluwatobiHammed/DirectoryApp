//
//  RoomCellViewModel.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 20/07/2021.
//

import Foundation


struct RoomCellViewModel {
    let name, availability, capacity: String
    let isOccupied: Bool
    
    init(room: VMRoomResponse) {
        self.name = "Room Name: \(room.name!)"
        self.availability = room.isAvailable!
        self.capacity =  "Room Capacity: \(room.maxOccupancy!)"
        self.isOccupied = room.isOccupied!
       
    }
}
