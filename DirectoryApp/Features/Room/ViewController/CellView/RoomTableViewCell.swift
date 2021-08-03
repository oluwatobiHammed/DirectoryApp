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
    
    
    func configRoom ( _ room: RoomCellViewModel) {
        nameLabel.useDefaultFont()
        capacityLabel.useDefaultFont()
        isOccupiedLabel.useDefaultFont()
        nameLabel.text = room.name
        capacityLabel.text = room.capacity
        isOccupiedLabel.text = room.isAvailable
        containerUIView.shadowColor  =  room.containerColor
    }
    
}
