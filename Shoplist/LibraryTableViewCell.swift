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
    
    var libraryItem : Item? {
        didSet {
            self.setup()
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
        self.nameLabel?.text = "\(item.name), bought \(item.numOfPurchaces) times"
        self.completionCheckbox.selected = item.isInList
    }
    
    func setupAppearance() {
        
    }
}