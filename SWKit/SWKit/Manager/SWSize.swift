//
//  SWSize.swift
//  SWKit
//
//  Created by 刘宏立 on 2019/12/27.
//  Copyright © 2019 刘宏立. All rights reserved.
//

import UIKit

struct SWSize {
    /// 屏幕宽度 : CGFloat
    static let screenWidth: CGFloat = UIScreen.main.bounds.size.width
    
    /// 屏幕高度 : CGFloat
    static let screenHeight: CGFloat = UIScreen.main.bounds.size.height
    
    /// 屏幕 bounds : CGFloat
    static let screenSize: CGRect = UIScreen.main.bounds
    
    /// tabBar 高度
    static let tabBarHeight: CGFloat = UIScreen.main.bounds.size.height == 812 ? 83 : 49
    
    /// navigationBar 高度(这个应该判断是否是全面屏)
    static let navBarHeight: CGFloat = UIScreen.main.bounds.size.height == 812 ? 88 : 64
    
    /// 底部安全视图高度
    static let safeHeight: CGFloat = 34
    
    /// 30 : CGFloat
    static let navBarHeightIncrease: CGFloat = 30
    
    
}
