//
//  adminViewController.swift
//  wongsgallery
//
//  Created by Ziwei on 2/8/20.
//  Copyright © 2020 Ziwei. All rights reserved.
//

import UIKit
import RealmSwift

class adminviewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    let realm = try! Realm()
    var imageResult:Results<itemImage>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageResult = realm.objects(itemImage.self)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageResult!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "editcell", for: indexPath) as! adminviewCell
        let pic = imageResult![indexPath.row]
        
        //cell.imagUrl = pic.imageURL
        cell.imageURL.image = UIImage(data: pic.imageURL!)
        cell.imagenameLable.text = pic.imageName
        
        return cell
    }
}



    
    
    

    

