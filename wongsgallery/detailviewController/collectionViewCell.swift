//
//  collectionViewCell.swift
//  wongsgallery
//
//  Created by Ziwei on 10/31/19.
//  Copyright © 2019 Ziwei. All rights reserved.
//

import UIKit
import RealmSwift

class collectionView: UICollectionViewCell {
    
    @IBOutlet weak var itemImage: UIImageView!
    
    func setImageCell(imageData:Data){
        itemImage.image = UIImage(data: imageData)

    }

    override func prepareForReuse() {
        super.prepareForReuse()
        itemImage.image = nil
    }
}
