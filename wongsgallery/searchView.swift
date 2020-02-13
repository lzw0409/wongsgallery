//
//  searchView.swift
//  wongsgallery
//
//  Created by Ziwei on 12/26/19.
//  Copyright © 2019 Ziwei. All rights reserved.
//


import UIKit

class searchView: UIViewController {
    
    // MARK: - Properties
    
    let searchBar = UISearchBar()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchBar()
    }
    
    // MARK: - Selectors
    
    @objc func handleShowSearchBar() {
        searchBar.becomeFirstResponder()
        search(shouldShow: true)
    }

    // MARK: - Helper Functions
    
    func configureSearchBar(){
        view.backgroundColor = .white
        
        searchBar.sizeToFit()
        searchBar.delegate = self
        
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 55/255, green: 120/255,blue: 250/255, alpha: 1)
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Wong's Gallery"
        showSearchBarButton(shouldShow: true)
    }
    
    
    func showSearchBarButton(shouldShow: Bool) {
        if shouldShow {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                                target: self,
                                                                action: #selector(handleShowSearchBar))
        } else {
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    func search(shouldShow: Bool) {
        showSearchBarButton(shouldShow: !shouldShow)
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar : nil
    }
}

extension searchView: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("Search bar editing did begin..")
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("Search bar editing did end..")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search(shouldShow: false)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Search text is \(searchText)")
    }
}


