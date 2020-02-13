//
//  ViewController.swift
//  wongsgallery
//
//  Created by Ziwei on 10/19/19.
//  Copyright © 2019 Ziwei. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    

    let realm = try! Realm()
    var categResult:Results<category>?
    var cateName: String = ""
    var imageResult:Results<itemImage>?
    var userResult:Results<userInfo>?
    var username: String = ""
    var password: String = ""
    
    
    
    //Pop up for log in as admin
/*    @IBAction func tapAdmin(_ sender: Any) {
        let showPopup = UIAlertController(title: "Admin Password", message: "Get access to add products", preferredStyle: .alert)
        showPopup.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        showPopup.addTextField(configurationHandler: { textField in
            textField.placeholder = "Input your User Name here..."
            
        })
        showPopup.addTextField(configurationHandler: { textField in
            textField.placeholder = "Input your Password here..."
            
        })
        showPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.username = (showPopup.textFields?.first!.text)!
            
            self.password = (showPopup.textFields?.last!.text)!
            print("username:" + self.username)
            print("password:" + self.password)
            
            self.userResult = self.realm.objects(userInfo.self).filter("userName == %@", self.username)
            
            let _password = self.userResult?.first?.userPass
            if self.password == _password{
                print("you have access as admin")
                if let adminView = self.storyboard?.instantiateViewController(withIdentifier: "adminView") as? adminviewController{
                    self.navigationController?.pushViewController(adminView, animated: true)
                }
            }else{
                print("please input a correct password")
            }
            
            }))
        
        self.present(showPopup, animated: true)
    }
    */

    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadimageData()
        categResult = realm.objects(category.self)
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categResult!.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130.00
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categCell", for: indexPath) as! categCell
        let pic = categResult![indexPath.row]
        
        cell.textLabel!.text = pic.categName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let categviewController = storyboard?.instantiateViewController(withIdentifier: "categViewController") as? categListView {
            //pass selected row#
            categviewController.selectedCateg = (selectedCell?.textLabel!.text)!
            navigationController?.pushViewController(categviewController, animated: true)
        }

    }
    
    func loadimageData(){
            /*if categResult!.count > 0 {
                return
            }*/
        let portlandacount = userInfo(value: ["wonginportland","123456",true])
        
            let countertop = category(value:["countertop"])
            let floor = category(value:["floor"])
            let cabinet = category(value:["cabinet"])
            let bathroom = category(value:["bathroom"])
            let table = category(value:["table"])
            
            
            let ctimageURL1 = Bundle.main.url(forResource: "2CMAfricanCanyon", withExtension: "jpeg")!
            let ctimageURL2 = Bundle.main.url(forResource: "2CMBluePearl", withExtension: "jpg")!
            let ctimageURL3 = Bundle.main.url(forResource: "EmeraldPearl", withExtension: "jpg")!
     //       let ctimageURL4 = Bundle.main.url(forResource: "Arlington Grey", withExtension: "jpg")!
            let ctimageURL5 = Bundle.main.url(forResource: "Bianco Carmel", withExtension: "jpg")!
            
            let flimageURL1 = Bundle.main.url(forResource: "Mornington", withExtension: "jpg")!
            let flimageURL2 = Bundle.main.url(forResource: "Mornington-1", withExtension: "jpg")!
            let flimageURL3 = Bundle.main.url(forResource: "Mornington-2", withExtension: "jpg")!
            let flimageURL4 = Bundle.main.url(forResource: "Mornington-3", withExtension: "jpg")!
            
            let cbimageURL1 = Bundle.main.url(forResource: "Chocolate", withExtension: "png")!
            let cbimageURL2 = Bundle.main.url(forResource: "Cocoa Shaker", withExtension: "png")!
            let cbimageURL3 = Bundle.main.url(forResource: "Espresso", withExtension: "png")!
            let cbimageURL4 = Bundle.main.url(forResource: "Grey Shaker", withExtension: "png")!
            
            let brimageURL1 = Bundle.main.url(forResource: "shower1", withExtension: "jpg")!
            
            let wtimageURL1 = Bundle.main.url(forResource: "woodtable1", withExtension: "jpg")!
            
            let ctimageData1 = try! Data(contentsOf: ctimageURL1)
            let ctimageData2 = try! Data(contentsOf: ctimageURL2)
            let ctimageData3 = try! Data(contentsOf: ctimageURL3)
    //        let ctimageData4 = try! Data(contentsOf: ctimageURL4)
            let ctimageData5 = try! Data(contentsOf: ctimageURL5)
            
            let flimageData1 = try! Data(contentsOf: flimageURL1)
            let flimageData2 = try! Data(contentsOf: flimageURL2)
            let flimageData3 = try! Data(contentsOf: flimageURL3)
            let flimageData4 = try! Data(contentsOf: flimageURL4)
            
            let cbimageData1 = try! Data(contentsOf: cbimageURL1)
            let cbimageData2 = try! Data(contentsOf: cbimageURL2)
            let cbimageData3 = try! Data(contentsOf: cbimageURL3)
            let cbimageData4 = try! Data(contentsOf: cbimageURL4)
            
            let brimageData1 = try! Data(contentsOf: brimageURL1)
            
            let wtimageData1 = try! Data(contentsOf: wtimageURL1)
            
            
            let putctImage1 = itemImage(value:[ctimageData1,countertop,"countertop","2CM African Canyon"])
            let putctImage2 = itemImage(value:[ctimageData2,countertop,"countertop","2CM Blue Pearl"])
            let putctImage3 = itemImage(value:[ctimageData3,countertop,"countertop","2CM Emeral Pearl"])
    //        let putctImage4 = itemImage(value:[0,ctimageData4,countertop])
            let putctImage5 = itemImage(value:[ctimageData5,countertop,"countertop","2CM Bianco Calacatta"])
            
            let putflImage1 = itemImage(value:[flimageData1,floor,"floor","Mornington"])
            let putflImage2 = itemImage(value:[flimageData2,floor,"floor","Mornington2"])
            let putflImage3 = itemImage(value:[flimageData3,floor,"floor","Mornington3"])
            let putflImage4 = itemImage(value:[flimageData4,floor,"floor","Mornington4"])
            
            let putcbImage1 = itemImage(value:[cbimageData1,cabinet,"cabinet","Chocolate Shaker"])
            let putcbImage2 = itemImage(value:[cbimageData2,cabinet,"cabinet","Cocoa Shaker"])
            let putcbImage3 = itemImage(value:[cbimageData3,cabinet,"cabinet","Espresso"])
            let putcbImage4 = itemImage(value:[cbimageData4,cabinet,"cabinet","Grey Shaker"])
            
            let putbrImage1 = itemImage(value:[brimageData1,bathroom,"bathroom","Black bathroom door"])
            
            let putwtImage1 = itemImage(value:[wtimageData1,table,"table","Wood table"])
            

            
            
            let africanCanyon2CM = item(value: ["2CM African Canyon",2,"Grannit","110*26/110*6",putctImage1])
            let bluePearl2CM = item(value: ["2CM Blue Pearl",2,"Grannit","110*26/110*6", putctImage2])
            let EmeralPearl2CM = item(value: ["2CM Emeral Pearl",2,"Grannit","110*26/110*6",putctImage3])
    //        let arlingtongrey = item(value: ["2CM Arlington Grey",2,"Qurtz",putctImage4])
            let biancocarmel = item(value: ["2CM Bianco Calacatta",2,"Qurtz","110*26/110*6",putctImage5])
            
            let Mornington = item(value: ["Mornington",0,"","Box",putflImage1])
            let Mornington2 = item(value: ["Mornington2",0,"","Box",putflImage2])
            let Mornington3 = item(value: ["Mornington3",0,"","Box",putflImage3])
            let Mornington4 = item(value: ["Mornington4",0,"","Box",putflImage4])
            
            let choclateshaker = item(value: ["Chocolate Shaker",0,"Shaker","Unit",putcbImage1])
            let whiteshaker = item(value: ["Cocoa Shaker",0,"Sheker","Unit",putcbImage2])
            let espressoshaker = item(value: ["Espresso",0,"Shaker","Unit",putcbImage3])
            let greyshaker = item(value: ["Grey Shaker",0,"Shaker","Unit",putcbImage4])
            
            let bathroomdoor = item(value: ["Black bathroom door",0,"","Unit",putbrImage1])
            let woodtable = item(value: ["Wood table",0,"","Unit",putwtImage1])
            
            
            try! realm.write{
                realm.add(portlandacount)
                realm.add(africanCanyon2CM)
                realm.add(bluePearl2CM)
                realm.add(EmeralPearl2CM)
                realm.add(biancocarmel)
                
                realm.add(Mornington)
                realm.add(Mornington2)
                realm.add(Mornington3)
                realm.add(Mornington4)
                
                realm.add(choclateshaker)
                realm.add(whiteshaker)
                realm.add(espressoshaker)
                realm.add(greyshaker)
                
                realm.add(bathroomdoor)
                
                realm.add(woodtable)
                
                
           //     realm.add(arlingtongrey)
            }
        }
}






