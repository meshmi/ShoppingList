//
//  ListViewController.swift
//  Shoplist
//
//  Created by Olesia Kalashnik on 6/26/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

import UIKit
class ListViewController: UIViewController
{
    weak var tableView: UITableView!
    weak var hideCompletedOutlet: UIBarButtonItem!

func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
{
    return true

var items = Library.shared
    var selectedItemWithoutDetails : Item?
    var selectedItemWithDetails : Item?
    //MARK: Controller Lifecycle
    {
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        return true

    
    func viewWillAppear(_ animated: Bool) {
    updateUI()
    }
    
    func updateUI() {
    
    
    //Helper Function
    func itemsGrouped() -> [[Item]] {
    
    func unique<C : Sequence, T : Hashable>(inputArray: C) -> [T] where C.Iterator.Element == T {
        
        var addedDict = [T:Bool]()
            return inputArray.filter { addedDict.updateValue(true, forKey: $0) == nil }
        }
    
    func hideCompleted(sender: UIBarButtonItem) {
        for item in Library.shared.items {
            if item.isCompleted {
                item.isInList = false
                item.isCompleted = false
                item.numOfPurchaces += 1
                item.lastTimeAddedToList = NSDate()
      
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destination as UIViewController
            guard let tabBarController = destination as? UITabBarController else { return }
            guard let tabBarVCs = tabBarController.viewControllers else { return }
            guard let navController = tabBarVCs.first as? UINavigationController else {return}
            destination = navController.visibleViewController!
            _ = destination as? LibraryViewController
        
    let indexPath = ListItemWithDetailsTableViewCell();


        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let item = itemsGrouped()[section].first else {return nil}
        return item.category
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = Defaults.UI.blueTransperent
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = UIColor.white
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsGrouped()[section].count
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
    {
        _ = UITableViewCell.self;
}
}
}
}
}
}
}
}
}
}
}
}
}
}
