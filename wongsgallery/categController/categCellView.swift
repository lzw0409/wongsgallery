//
//  categCellView.swift
//  wongsgallery
//
//  Created by Ziwei on 12/21/19.
//  Copyright © 2019 Ziwei. All rights reserved.
//

import UIKit

class categCellView:UICollectionViewCell{
    
    override init(frame:CGRect){
        
        super.init(frame:frame)
        
        self.myLabel.frame = CGRect(x: 10, y: frame.size.width - 10, width: frame.size.width - 20, height: 20)
        self.myImageView.frame = CGRect(x: 10, y: 10, width: frame.size.width - 20, height: frame.size.width - 20)
        self.contentView.backgroundColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1.0)
        self.contentView .addSubview(self.myLabel)
        self.contentView .addSubview(self.myImageView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    


var myLabel:UILabel = {

    let label = UILabel()
    label.text = ""
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 12)
    return label

}()

    var myImageView:UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = nil
        return imageView
    
    }()
    
    
    
}
