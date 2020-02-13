//
//  adminviewCell.swift
//  wongsgallery
//
//  Created by Ziwei on 2/8/20.
//  Copyright © 2020 Ziwei. All rights reserved.
//

import UIKit

class adminviewCell: UITableViewCell {
    
    @IBOutlet weak var imageURL: UIImageView!
    
    @IBOutlet weak var imagenameLable: UILabel!
    
    @IBAction func editFunc(_ sender: Any) {
        print("CLICK EDIT")
    }
    var nameLable:String = ""
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    
}
