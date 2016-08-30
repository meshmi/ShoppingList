//
//  FavoritesViewController.swift
//  Shoplist
//
//  Created by Olesia Kalashnik on 7/5/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var library = Library.shared
    var favoriteItems = Library.shared.items.filter({$0.numOfPurchaces > 0}) {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    func setupAppearance() {
        self.tableView.rowHeight = Defaults.UI.recentsFavoritsRowHeight
        self.favoriteItems = library.items.filter({$0.numOfPurchaces > 0})
        }
    }
    
    //MARK: - Controller Lifecycle
    
    //MARK: - @IBActions
    


//MARK: - TableView DataSource Methods
