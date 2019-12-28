//
//  SWCircleProgress.swift
//  SWKit
//
//  Created by 刘宏立 on 2019/12/27.
//  Copyright © 2019 刘宏立. All rights reserved.
//

import UIKit

class SWCircleProgress: UIView {
    
    open var trackLineWidth: CGFloat = 3 {
        didSet {
            self.trackLayer.lineWidth = trackLineWidth
            self.radius = frame.width / 2 - trackLineWidth
            self.circularPath = UIBezierPath(arcCenter: .zero, radius: self.radius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
            trackLayer.path = circularPath.cgPath
            trackLayer.lineWidth = trackLineWidth
            shapelayer.path = circularPath.cgPath
            shapelayer.lineWidth = shapeLineWidth
        }
    }
    open var shapeLineWidth: CGFloat = 3 {
        didSet {
            self.shapelayer.lineWidth = shapeLineWidth
            
            self.radius = frame.width / 2 - trackLineWidth
            self.circularPath = UIBezierPath(arcCenter: .zero, radius: self.radius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
            trackLayer.path = circularPath.cgPath
            trackLayer.lineWidth = trackLineWidth
            shapelayer.path = circularPath.cgPath
            shapelayer.lineWidth = shapeLineWidth
        }
    }
    
    
    private lazy var trackLayer: CAShapeLayer = {
        return CAShapeLayer()
    }()
    
    private var circularPath: UIBezierPath = {
        return UIBezierPath(arcCenter: .zero, radius: 1, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
    }()
    
    private var radius: CGFloat = 50
    
    let shapelayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.radius = frame.width / 2 - trackLineWidth
        
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func setupUI() {
        trackLayer = CAShapeLayer()
        let radius = self.frame.width / 2 - trackLineWidth
        circularPath = UIBezierPath(arcCenter: .zero, radius: radius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = trackLineWidth
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = .round
        trackLayer.position = self.center
        self.layer.addSublayer(trackLayer)
        shapelayer.path = circularPath.cgPath
        shapelayer.strokeColor = UIColor.systemTeal.cgColor
        shapelayer.lineWidth = shapeLineWidth
        shapelayer.fillColor = UIColor.clear.cgColor
        shapelayer.strokeEnd = 0
        shapelayer.lineCap = .round
        shapelayer.position = self.center
        self.layer.addSublayer(shapelayer)
        shapelayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
    }
}
