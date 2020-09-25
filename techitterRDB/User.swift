//
//  User.swift
//  techitterRDB
//
//  Created by 関川隼人 on 2020/09/25.
//  Copyright © 2020 関川隼人. All rights reserved.
//

import Foundation
import RealmSwift

class Tweet: Object{
    @objc dynamic var  name = ""
    @objc dynamic var text = ""
}

class User: Object{
    @objc dynamic var name = ""
//    override static func primaryKey() -> String? {
//        return "name"
//    }
}
