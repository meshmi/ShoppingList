//
//  AddItemTableViewController.swift
//  Shoplist
//
//  Created by Olesia Kalashnik on 7/4/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailsTextField: UITextField!
    
    var item : Item?
    @IBOutlet weak var addImageButton: UIButton!
    let library = Library.shared
    var image : UIImage? {
        didSet {
            self.rememberedEditedImage = image
            self.navigationItem.rightBarButtonItem?.title = "Save"
            
        }
    }
    
    private var category : String?
    @IBOutlet weak var imageView: UIImageView!
    
    private var rememberedEditedDetailsText : String?
    private var rememberedEditedImage : UIImage?
    
    //MARK: Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
            }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setup()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.rememberedEditedDetailsText = self.detailsTextField.text
    }
    
    //MARK: @IBActions
    @IBAction func saveNewItem(sender: UIBarButtonItem) {
        if sender.title == "Save" {
            if let newItem = self.nameTextField.text {
                if newItem != "" {
                    if let selectedCategory = self.category {
                        item = Item(name: newItem, category: selectedCategory)
                    } else {
                        item = Item(name: newItem, category: "None")
                    }
                    item!.isInList = true
                    item!.isCompleted = false
                    item!.numOfPurchaces = 0
                    item!.detailsText = detailsTextField.text
                    item!.image = self.imageView.image
                    library.saveObjects();
                }
            }
        }
        self.nameTextField.text = nil
        self.detailsTextField.text = nil
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func Cancel(sender: UIBarButtonItem) {
        self.rememberedEditedDetailsText = nil
        self.rememberedEditedImage = nil
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - TableView DataSource Methods
    private struct TableViewConstants {
        static let numberOfSections = 3
        static let rowsInSectionOne = 2
        static let rowsInSectionTwo = 12
        static let rowsInSectionThree = 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return TableViewConstants.numberOfSections
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Category"
        } else if section == 2 {
            return "Image"
        }
        return nil
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = Defaults.UI.blueTransperent
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = UIColor.white
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowsBySection = [TableViewConstants.rowsInSectionOne, TableViewConstants.rowsInSectionTwo, TableViewConstants.rowsInSectionThree]
        return rowsBySection[section]
    }
    
    //MARK: - TableView Delegate Methods
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.section == 1) {
            self.category = Defaults.allCategories[indexPath.row]
            tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        }
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.section == 1) {
            self.category = Defaults.allCategories[indexPath.row]
            tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = UITableViewCellAccessoryType.none
        }
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        if indexPath.section == 1 && (item != nil) {
            return nil
        }
        return indexPath
    }
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if let photoVC = segue.destination as? PhotoViewController {
                if let safeImage = self.imageView.image {
                    photoVC.image = safeImage
                }
            }
        }
    }

//MARK: TextFieldDelegate Methods
extension AddItemTableViewController : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.navigationItem.rightBarButtonItem?.title = "Save"
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if nameTextField.text == nil || nameTextField.text == "" {
            self.navigationItem.rightBarButtonItem?.title = "Done"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension AddItemTableViewController
{ func setup() {
}
}
