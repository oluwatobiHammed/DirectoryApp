//
//  RoomCellViewModel.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 20/07/2021.
//

import Foundation
import UIKit

struct RoomCellViewModel {
    let name, isAvailable, capacity: String
    let containerColor: UIColor
    
    init(room: VMRoomResponse) {
        self.name = "Room Name: \(room.name!)"
        self.isAvailable = room.isOccupied! ? "Rooom Unavailable" : "Room Available"
        self.capacity =  "Room Capacity: \(room.maxOccupancy!)"
        self.containerColor = (room.isOccupied! ? ThemeManager.currentTheme().dangerColor  :   ThemeManager.currentTheme().sucessColor)!
    }
}
