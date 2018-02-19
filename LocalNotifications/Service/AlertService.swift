//
//  AlertService.swift
//  LocalNotifications
//
//  Created by Patel, Vandan (ETW - FLEX) on 2/17/18.
//

import Foundation
import UIKit

class AlertService {
    private init() {}
    
    static func actionSheet(in vc: UIViewController, title: String, completion: @escaping ()->()) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let action = UIAlertAction(title: title, style: .default) { (_) in
            completion()
        }
        alert.addAction(action)
        vc.present(alert, animated: true)
    }
}
