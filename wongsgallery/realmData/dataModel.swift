//
//  dataModel.swift
//  wongsgallery
//
//  Created by Ziwei on 10/30/19.
//  Copyright © 2019 Ziwei. All rights reserved.
//

import UIKit
import RealmSwift

class category: Object {
    @objc dynamic var categName = ""
    override class func primaryKey() -> String? {
        return "categName"
    }
}

class item: Object {
    @objc dynamic var itemName = ""
    @objc dynamic var thickness:Int = 0
    @objc dynamic var itemsubType = ""
    @objc dynamic var salesize = ""
    @objc dynamic var itemImage: itemImage?
    let itemimage = List<itemImage>()
    
}

class itemImage: Object{
    @objc dynamic var imageURL: Data?
    @objc dynamic var type: category?
    @objc dynamic var selecName: String = ""
    @objc dynamic var imageName: String = ""
    @objc dynamic var bookMark: Bool = false
}

class userInfo: Object {
    @objc dynamic var userName: String = ""
    @objc dynamic var userPass: String = ""
    //@objc dynamic var firstName: String = ""
    //@objc dynamic var lastName: String = ""
    //@objc dynamic var userEmail: String = ""
    @objc dynamic var adminAccess: Bool = false

    
}






