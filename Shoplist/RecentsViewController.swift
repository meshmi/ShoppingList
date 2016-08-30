//
//  RecentsViewController.swift
//  Shoplist
//
//  Created by Olesia Kalashnik on 7/5/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

import UIKit

class RecentsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var library = Library.shared
    var recentItems = Library.shared.items.filter({$0.lastTimeAddedToList != nil})
        {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    func setupAppearance() {
        self.tableView.rowHeight = Defaults.UI.recentsFavoritsRowHeight
        self.recentItems = library.items.filter({$0.lastTimeAddedToList != nil})
    }
    }
    
    //MARK: - Controller Lifecycle
    func viewDidLoad() {
        viewDidLoad()

    
    //MARK: - @IBActions
   

//MARK: - TableView DataSource Methods
        }
