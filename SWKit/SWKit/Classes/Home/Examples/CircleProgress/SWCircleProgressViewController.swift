//
//  SWCircleProgressViewController.swift
//  SWKit
//
//  Created by 刘宏立 on 2019/12/27.
//  Copyright © 2019 刘宏立. All rights reserved.
//

import UIKit

class SWCircleProgressViewController: UIViewController {
    
    var shapelayer = CAShapeLayer()
    var progressContainer: UIView!
    
    let urlString = "http://panm32w98.bkt.clouddn.com/short_video_20191116010728.mp4"
    
    deinit {
        print("deinit \(self)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        title = "CircleProgress"
        
        setupUI()
    }
    
    func setupUI() {
        let width: CGFloat = 120
        let height: CGFloat = 50
        let offset_y: CGFloat = 120
        let btn = UIButton.init(type: .custom)
        view.addSubview(btn)
        btn.frame = CGRect(x: (SWSize.screenWidth - width)/2, y: offset_y, width: width, height: height)
        btn.setTitle("视频下载", for: .normal)
        btn.titleLabel?.textColor = UIColor.init(white: 0.7, alpha: 1)
        btn.backgroundColor = .systemTeal
        btn.layer.cornerRadius = height / 2
        btn.layer.masksToBounds = true
        
        btn.action { [weak self](sender) in
            self?.downLoadVideo()
        }
        
        let width_p: CGFloat = 100
        let f = CGRect(x: (SWSize.screenWidth - width_p)/2, y: (SWSize.screenHeight - SWSize.navBarHeight - width_p)/2, width: width_p, height: width_p)
        
        progressContainer = UIView.init(frame: f)
        self.view.addSubview(progressContainer)
        progressContainer.backgroundColor = .lightGray
//        progressContainer.isHidden = true
        // 进度条
        let frame = CGRect(x: 0, y: 0, width: width_p, height: width_p)
//        let progressView = SWCircleProgress.init(frame: frame, radius: width_p/2 - 5)
        let progressView = SWCircleProgress.init(frame: frame)
        progressContainer.addSubview(progressView)
        progressView.backgroundColor = .orange
        progressView.shapelayer.strokeEnd = 0.0
        progressView.trackLineWidth = 8
        progressView.shapeLineWidth = 6
        
        self.shapelayer = progressView.shapelayer
    }
    
    func downLoadVideo() {
        print("attempting to animate stroke")
        let configuration = URLSessionConfiguration.default
        let operationQueue = OperationQueue()
        let urlSession = URLSession(configuration: configuration, delegate: self, delegateQueue: operationQueue)
        guard let url = URL(string:urlString) else {return}
        let downloadTask = urlSession.downloadTask(with: url)
        downloadTask.resume()
    }
}

extension SWCircleProgressViewController: URLSessionDownloadDelegate{
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let percentage = CGFloat(totalBytesWritten) /
            CGFloat(totalBytesExpectedToWrite)
        DispatchQueue.main.async {
            if percentage > 0 && percentage < 1 {
                self.progressContainer.isHidden = false
            }
            else {
                self.progressContainer.isHidden = true
            }
            self.shapelayer.strokeEnd = percentage
        }
        print(percentage)
    }
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("finished downloading file")
    }
}
