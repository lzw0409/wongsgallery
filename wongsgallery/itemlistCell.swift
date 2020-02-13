//
//  itemlistCell.swift
//  wongsgallery
//
//  Created by Ziwei on 10/25/19.
//  Copyright © 2019 Ziwei. All rights reserved.
//

import UIKit

class itemlistCell: UITableViewCell {
    
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    
    func setitemCell(item:itemInfo) {
        itemImage.image = item.image
        itemTitle.text = item.title
    }
}
