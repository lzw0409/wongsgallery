//
//  categCell.swift
//  wongsgallery
//
//  Created by Ziwei on 10/19/19.
//  Copyright © 2019 Ziwei. All rights reserved.
//

import UIKit;

class categCell:UITableViewCell{
    
    @IBOutlet weak var categcells: UIView!
    
    @IBOutlet weak var categImage: UIImageView!
    @IBOutlet weak var categTitle: UILabel!
    

    func setCateg(item:itemInfo) {
        categImage.image = item.image
        categTitle.text = item.title
    }
}

