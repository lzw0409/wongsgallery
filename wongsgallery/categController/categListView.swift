//
//  categListView.swift
//  wongsgallery
//
//  Created by Ziwei on 10/31/19.
//  Copyright © 2019 Ziwei. All rights reserved.
//

import UIKit
import RealmSwift

class categListView:UIViewController, UICollectionViewDelegate,UICollectionViewDataSource
{
    
    let realm = try! Realm()
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    var idenContentString = "itemImage"
    let headIdenString = "headIdenString"
    let searchBar = UISearchBar()
    var searchController: UISearchController!
    var hasinput:Bool = false
    var selectedtab:Int = 0
    
//    @IBOutlet weak var searchContainerView: UIView!
    var ourCollectionView: UICollectionView!
    
    var selectedCateg: String = ""
    var searchImage:String = ""
    //var sendFrom:String = ""
    var imageResult:Results<itemImage>?
    var imagesearchResult:Results<itemImage>?
    
    
    //load bookmarked item
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedtab = tabBarController!.selectedIndex
        if selectedtab == 2 {
            
            imageResult = realm.objects(itemImage.self).filter("bookMark == true")
        }else{
            imageResult = realm.objects(itemImage.self).filter("selecName == %@", selectedCateg)}
            //print(imageResult!)

        self.collectionviewlayout()
        self.searchbarUI()
        //ourCollectionView.reloadData()
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //print(selectedtab)
        ourCollectionView.reloadData()
    }
    
    func searchbarUI(){
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        // 将搜索控制器集成到导航栏上
        
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.title = "Wong's Gallery"
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Gallery"
        definesPresentationContext = true
    }
    
    func isFiltering() -> Bool {
        let status = self.searchController.isActive && !searchBarIsEmpty()
        return status
    }
    func searchBarIsEmpty() -> Bool {
      // Returns true if the text is empty or nil
        return self.searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") -> Results<itemImage>{
        imagesearchResult = realm.objects(itemImage.self).filter("imageName CONTAINS[c] %@", searchText)
        return imagesearchResult!
    }
    


    func collectionviewlayout(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        layout.itemSize = CGSize(width: (screenWidth-10)/2, height: (screenWidth+10)/2)
        
        ourCollectionView = UICollectionView(frame: CGRect(x: 0,y: 0,width: screenWidth,height: screenHeight), collectionViewLayout: layout)
        
        ourCollectionView.delegate = self
        ourCollectionView.dataSource = self
        ourCollectionView.backgroundColor = UIColor.white
        ourCollectionView.register(categCellView.self, forCellWithReuseIdentifier: idenContentString)
        self.view.addSubview(ourCollectionView)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFiltering(){
            //print("true")
            return (self.imagesearchResult!.count)
            
        }else{
            //print("false")
            return (self.imageResult!.count)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idenContentString, for: indexPath) as! categCellView
        var index: itemImage!
        if isFiltering(){
            index = self.imagesearchResult![indexPath.row]
            
        }else{
            index = self.imageResult![indexPath.row]
            
        }
        cell.myImageView.image = UIImage(data:index.imageURL!)
        cell.myLabel.text = index.imageName
        //cell.setImageCell(imageData: (index.imageURL!))
        cell.myImageView.backgroundColor = UIColor.gray
        return cell
        
    }
    
    
    //MARK:UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
        return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedCell = collectionView.cellForItem(at: indexPath) as! categCellView
        ourCollectionView.deselectItem(at: indexPath, animated: true)
        
        if let detailviewcontroller = storyboard?.instantiateViewController(withIdentifier: "detailView") as? detaiViewController{
            detailviewcontroller.selectedName = selectedCell.myLabel.text!
            navigationController?.pushViewController(detailviewcontroller, animated: true)
        }
        
    }


}

extension categListView: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(self.searchController.searchBar.text!)
    }
    
}


extension categListView: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        ourCollectionView.reloadData()
        print("cencel")
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        ourCollectionView.reloadData()
        print("search")
    }
    
    
}


