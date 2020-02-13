//
//  tabbarView.swift
//  wongsgallery
//
//  Created by Ziwei on 2/10/20.
//  Copyright © 2020 Ziwei. All rights reserved.
//

import UIKit

class tabBarView: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(tabBarController?.viewControllers)
        
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let selected = String(tabBar.selectedItem!.title!)
        //print(selected)
        
            
            
        }
    }


