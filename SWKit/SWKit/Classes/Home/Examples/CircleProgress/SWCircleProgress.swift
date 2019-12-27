//
//  SWCircleProgress.swift
//  SWKit
//
//  Created by 刘宏立 on 2019/12/27.
//  Copyright © 2019 刘宏立. All rights reserved.
//

import UIKit

class SWCircleProgress: UIView {
    
    let shapelayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func setupUI() {
        let trackLayer = CAShapeLayer()
        let radius = self.frame.width / 2 - 10
        let circularPath = UIBezierPath(arcCenter: .zero, radius: radius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10.0
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = .round
        trackLayer.position = self.center
        self.layer.addSublayer(trackLayer)
        shapelayer.path = circularPath.cgPath
        shapelayer.strokeColor = UIColor.systemTeal.cgColor
        shapelayer.lineWidth = 10.0
        shapelayer.fillColor = UIColor.clear.cgColor
        shapelayer.strokeEnd = 0
        shapelayer.lineCap = .round
        shapelayer.position = self.center
        self.layer.addSublayer(shapelayer)
        shapelayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
    }
}
