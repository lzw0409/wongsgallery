//
//  detailViewController.swift
//  wongsgallery
//
//  Created by Ziwei on 1/7/20.
//  Copyright © 2020 Ziwei. All rights reserved.
//

import UIKit
import RealmSwift

class detaiViewController: UIViewController {
    
    let realm = try! Realm()
    var selectedName:String = ""
    var itemdetailresults:Results<item>?
    var imagedata:Data!
    
    @IBOutlet weak var detailimage: UIImageView!
    
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var materiallabel: UILabel!
    @IBOutlet weak var sizelabel: UILabel!
    @IBOutlet weak var countrylabel: UILabel!
    
    @IBOutlet weak var bookMark: UIBarButtonItem!
    
    @IBAction func markImage(_ sender: UIBarButtonItem) {
        
        if (itemdetailresults?.first?.itemImage?.bookMark == false){
            try! realm.write{
                itemdetailresults?.first?.itemImage?.bookMark = true
            }
            bookMark.image = UIImage(named: "fav-2")
        }else{
            try! realm.write{
                itemdetailresults?.first?.itemImage?.bookMark = false
            }
            bookMark.image = UIImage(named: "fav")
        }
                
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookMark.image = UIImage(named: "fav")
        itemdetailresults = realm.objects(item.self).filter("itemName == %@", selectedName)
        imagedata = (itemdetailresults?.first?.itemImage?.imageURL)!
        
        favtapped()
        setupdetail()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupdetail(){
        detailimage.image = UIImage(data: imagedata)
        itemTitle.text = itemdetailresults?.first?.itemImage?.imageName
        materiallabel.text = itemdetailresults?.first?.itemsubType
        sizelabel.text = itemdetailresults?.first?.salesize
        //markImage(bookMark!)
        
        
    }
    @objc func favtapped(){
        if (itemdetailresults?.first?.itemImage?.bookMark == true) {
            
            bookMark.image = UIImage(named: "fav-2")
        }else{
            bookMark.image = UIImage(named: "fav")
            
        }
    }
    

}


