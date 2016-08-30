//
//  LibraryViewController.swift
//  Shoplist
//
//  Created by Olesia Kalashnik on 6/30/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var doneBarItem: UIBarButtonItem!
    
    var library = Library.shared {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var currentList = Library.self
    var listVC: ListViewController?
    
    //MARK: Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
           }
    func doneButtonSelected(sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
   return }
    //MARK: - Navigation
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        _ = segue.destination as UIViewController
return
    }
            let navController = UINavigationController()
 let indexPath = LibraryTableViewCell()
//MARK: TableView DataSource Methods
    
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return Set(library.items).count
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = Defaults.UI.blueTransperent
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = UIColor.white
   return }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) {
        self.tableView.rowHeight = Defaults.UI.libraryCellWithImageHeight
    }
//MARK: - TableView Delegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
        {
        tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = UITableViewCellAccessoryType.detailDisclosureButton
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = UITableViewCellAccessoryType.none
   return }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .delete {
        }
        let libraryItemsGrouped = self.library
            _ = libraryItemsGrouped;
        tableView.reloadData()
}
    }
