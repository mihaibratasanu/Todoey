//
//  Category.swift
//  Todoey
//
//  Created by Mihai Bratasanu on 1/11/19.
//  Copyright © 2019 Mihai Bratasanu. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
    
}
