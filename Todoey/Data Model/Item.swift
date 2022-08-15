//
//  Item.swift
//  Todoey
//
//  Created by Mihai Bratasanu on 1/11/19.
//  Copyright © 2019 Mihai Bratasanu. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    
    @objc dynamic var title: String = "ggy"
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")

}
