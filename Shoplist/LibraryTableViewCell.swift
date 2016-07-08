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
            self.setup()
            self.setupAppearance()
        }
    }
    
    @IBAction func completionChecked(sender: CheckboxButton) {
        sender.selected = !sender.selected
        libraryItem?.isInList = sender.selected
        libraryItem?.isCompleted = false
    }
}

extension LibraryTableViewCell : Setup {
    
    func setup() {
        guard let item = self.libraryItem else { return }
        self.nameLabel?.text = item.name.lowercaseString
        self.completionCheckbox.selected = item.isInList
        itemImageView.image = item.image
    }
    
    func setupAppearance() {
        self.imageView?.layer.cornerRadius = 25
    }
}