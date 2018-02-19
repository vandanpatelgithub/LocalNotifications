//
//  ShadowView.swift
//  LocalNotifications
//
//  Created by Patel, Vandan (ETW - FLEX) on 2/16/18.
//

import UIKit

class ShadowView: UIView {
    override func awakeFromNib() {
        layer.shadowPath = CGPath(rect: layer.bounds, transform: nil)
        layer.shadowColor = UIColor.blue.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 5
        layer.cornerRadius = 5
    }
}
