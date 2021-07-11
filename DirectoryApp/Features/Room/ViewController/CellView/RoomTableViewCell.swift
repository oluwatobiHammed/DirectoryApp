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
    
    
    
    func configRoom ( _ room: VMRoomResponse) {
        
        if let isOccupied = room.is_occupied,
           let maxOccupancy = room.max_occupancy,
           let name = room.name{
            nameLabel.useDefaultFont()
            capacityLabel.useDefaultFont()
            isOccupiedLabel.useDefaultFont()
            print("Name:",name)
            nameLabel.text = "Name: "
            capacityLabel.text = "Max Occupancy: " + "\(maxOccupancy)"
            //imageViewer.alpha = 0
            //cardView.shadowColor = UIColor.colorFromHexString(favouriteColor)
        }
    }
    
}
