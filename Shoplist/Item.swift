//
//  Item.swift
//  Shoplist
//
//  Created by Olesia Kalashnik on 6/26/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

import UIKit

class Item : NSObject, NSCoding {
    public func encode(with aCoder: NSCoder) {
}

    let name: String
    let category : String
    var isInList : Bool
    var isCompleted : Bool
    var detailsText : String?
    var image: UIImage?
    var lastTimeAddedToList: NSDate?
    var numOfPurchaces : Int
    
    init(name: String, category: String, isInList : Bool = false, completed: Bool = false, details: String? = nil, image : UIImage? = nil, isCompleted: Bool = false, addTime: NSDate? = nil, numOfPurchaces : Int = 0) {
        self.name = name
        self.category = category
        self.isInList = isInList
        self.isCompleted = completed
        self.detailsText = details
        self.image = image
        self.lastTimeAddedToList = addTime
        self.numOfPurchaces = numOfPurchaces
    }
    
    struct PropertyKey {
        static let name = "name"
        static let category = "category"
        static let isInList = "isInList"
        static let isCompleted = "isCompleted"
        static let detailsText = "detailsText"
        static let image = "image"
        static let lastTimeAddedToList = "lastTimeAddedToList"
        static let numOfPurchaces = "numOfPurchaces"
    }
    
    func equals(item: Item) -> Bool {
        return (self.name == self.name) && (self.category == item.category)
    }
    
    // MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("items")
    
    // MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(category, forKey: PropertyKey.category)
        aCoder.encode(isInList, forKey: PropertyKey.isInList)
        aCoder.encode(isCompleted, forKey: PropertyKey.isCompleted)
        aCoder.encode(detailsText, forKey: PropertyKey.detailsText)
        aCoder.encode(image, forKey: PropertyKey.image)
        aCoder.encode(lastTimeAddedToList, forKey: PropertyKey.lastTimeAddedToList)
        aCoder.encode(numOfPurchaces, forKey: PropertyKey.numOfPurchaces)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.name) as! String
        let category = aDecoder.decodeObject(forKey: PropertyKey.category) as! String
        let isInList = aDecoder.decodeObject(forKey: PropertyKey.isInList) as! Bool
        let isCompleted = aDecoder.decodeObject(forKey: PropertyKey.isCompleted) as! Bool
        let detailsText = aDecoder.decodeObject(forKey: PropertyKey.detailsText) as? String
        let image = aDecoder.decodeObject(forKey: PropertyKey.image) as? UIImage
        let lastTimeAddedToList = aDecoder.decodeObject(forKey: PropertyKey.lastTimeAddedToList) as? NSDate
        let numOfPurchaces = aDecoder.decodeObject(forKey: PropertyKey.numOfPurchaces) as! Int
        
        self.init(name: name, category: category, isInList: isInList, completed: isCompleted, details: detailsText, image: image, addTime: lastTimeAddedToList, numOfPurchaces: numOfPurchaces)
    }
    
}
