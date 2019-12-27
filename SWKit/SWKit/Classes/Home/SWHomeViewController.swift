//
//  SWHomeViewController.swift
//  SWKit
//
//  Created by 刘宏立 on 2019/12/27.
//  Copyright © 2019 刘宏立. All rights reserved.
//

import UIKit

class SWHomeViewController: UIViewController {
    
    enum CellEnum: String {
        case progress = "progress"
        case fade = "fade"
        case search = "search"
    }
    
    struct TableViewData {
        var title: String = ""
        var subtitle: String = ""
        var image: String = ""
        
        var id: String = ""
    }
    
    let KUITableViewCell = "UITableViewCell"
    var tableView:UITableView!
    
    // 数据
    private var datalist = [TableViewData]()
    
    deinit {
        print("deinit \(self)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        data()
        setupUI()
    }
    
    
    func data() {
        let data0 = TableViewData.init(title: "进度条", subtitle: "", image: "", id: CellEnum.progress.rawValue)
        let data1 = TableViewData.init(title: "弹出视图", subtitle: "", image: "", id: CellEnum.fade.rawValue)
        let data2 = TableViewData.init(title: "搜索界面", subtitle: "", image: "", id: CellEnum.search.rawValue)
        
        self.datalist = [data0,
                         data1,
                         data2]
        
    }
    
    
    func setupUI() {
        tableView = UITableView.init(frame: view.frame, style: .grouped)
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: KUITableViewCell)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SWHomeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datalist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        cell.layer.shouldRasterize = true
        cell.textLabel?.text = "\(indexPath.row). \(datalist[indexPath.row].title)"
        cell.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        cell.layer.rasterizationScale = UIScreen.main.scale
        cell.textLabel?.textColor = UIColor.init(red: 43/255.0, green: 133/255.0, blue: 208/255.0, alpha: 1.0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let id = datalist[indexPath.row].id
        switch id {
        case CellEnum.progress.rawValue:
            let vc = SWCircleProgressViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            let vc = SWCircleProgressViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
}
