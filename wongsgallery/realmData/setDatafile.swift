//
//  setDatafile.swift
//  wongsgallery
//
//  Created by Ziwei on 11/11/19.
//  Copyright © 2019 Ziwei. All rights reserved.
//

import UIKit

class dataInfo {
    var categID: Int
    var itemName: String
    var subID: String
    
    init(categID:Int, itemName:String, subID:String) {
        self.categID = categID
        self.itemName = itemName
        self.subID = subID
    }
}
