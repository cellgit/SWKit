//
//  SWHomeViewController.swift
//  SWKit
//
//  Created by 刘宏立 on 2019/12/27.
//  Copyright © 2019 刘宏立. All rights reserved.
//

import UIKit

class SWHomeViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: self.view.frame, style: .grouped)
//        self.view.addSubview(tableView)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        tableView.contentInset = UIEdgeInsets(top: SWSize.navBarHeight, left: 0, bottom: SWSize.navBarHeight + SWSize.tabBarHeight, right: 0)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .orange
    }
    

    

}
