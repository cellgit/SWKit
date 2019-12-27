//
//  SWButton.swift
//  SWKit
//
//  Created by 刘宏立 on 2019/12/27.
//  Copyright © 2019 刘宏立. All rights reserved.
//

import UIKit

var buttonBackKey = "buttonBackKey"

typealias buttonBlock = (_ sender: UIButton) -> Void

extension UIButton {
    var buttonBack: buttonBlock? {
        set {
            objc_setAssociatedObject(self, &buttonBackKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &buttonBackKey) as? buttonBlock
        }
    }
    open func action(_ block: @escaping ((_ self: UIButton) -> ())) {
        self.addTarget(self, action: #selector(evt_btn_action(sender:)), for: .touchUpInside)
        self.buttonBack = block
    }
    @objc private func evt_btn_action(sender: UIButton) {
        guard let call = buttonBack else { return }
        call(sender)
    }
}
