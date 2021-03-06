//
//  LibraryTableViewCell.swift
//  Shoplist
//
//  Created by Olesia Kalashnik on 6/30/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

import UIKit

class LibraryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var completionCheckbox: CheckboxButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    
    var libraryItem : Item? {
        didSet {
        }
    }
    
    @IBAction func completionChecked(sender: CheckboxButton) {
        sender.isSelected = !sender.isSelected
        libraryItem?.isInList = sender.isSelected
        libraryItem?.isCompleted = false
    }
}
