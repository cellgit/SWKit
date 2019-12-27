//
//  SWMainViewController.swift
//  SWKit
//
//  Created by 刘宏立 on 2019/12/27.
//  Copyright © 2019 刘宏立. All rights reserved.
//

import UIKit

struct SWMainChildrenStruct {
    var title: String = ""
    var image: String = ""
    var vc: UIViewController!
}

class SWMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupChildren()
    }
    
    func setupChildren() {
        let first = SWMainChildrenStruct.init(title: "SWKit", image: "me", vc: SWHomeViewController())
        let second = SWMainChildrenStruct.init(title: "Tools", image: "me", vc: SWHomeViewController())
        
        let array = [first,second]
        var arrayM = [UIViewController]()
        for item in array {
            arrayM.append(self.children(item))
        }
        self.viewControllers = arrayM
    }
    
    func children(_ params: SWMainChildrenStruct) -> UIViewController {
        let vc: UIViewController = params.vc
        vc.title = params.title
        let image = "tabbar_icon_\(params.image)_normal"
        let image_hl = "tabbar_icon_\(params.image)_highlight"
        vc.tabBarItem.image = UIImage.init(named: image)
        vc.tabBarItem.selectedImage = UIImage.init(named: image_hl)?.withRenderingMode(.alwaysOriginal)
        let nav = UINavigationController.init(rootViewController: vc)
        return nav
    }
    
}
