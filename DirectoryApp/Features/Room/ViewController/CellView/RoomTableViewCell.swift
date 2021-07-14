//
//  RoomTableViewCell.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 11/07/2021.
//

import UIKit

class RoomTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var capacityLabel: UILabel!
    @IBOutlet weak var isOccupiedLabel: UILabel!
    @IBOutlet weak var containerUIView: DesignView!
    
    static let Identifier =  String(describing: RoomTableViewCell.self) 
    
    
    func configRoom ( _ room: VMRoomResponse) {
        nameLabel.useDefaultFont()
        capacityLabel.useDefaultFont()
        isOccupiedLabel.useDefaultFont()
        if let name = room.name,
           let capacity = room.maxOccupancy,
           let availability = room.isAvailable,
           let isOccupied = room.isOccupied
        {
            nameLabel.text = "Room Name: \(name)"
            capacityLabel.text = "Room Capacity: \(capacity)"
            isOccupiedLabel.text = availability
            containerUIView.shadowColor  =  isOccupied ? ThemeManager.currentTheme().dangerColor  :   ThemeManager.currentTheme().sucessColor
            
        }
        
    }
    
}
