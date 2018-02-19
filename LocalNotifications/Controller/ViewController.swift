//
//  ViewController.swift
//  LocalNotifications
//
//  Created by Patel, Vandan (ETW - FLEX) on 2/16/18.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UNService.shared.authorize()
    }
    
    @IBAction func didTapTimer(_ sender: UIButton) {
        AlertService.actionSheet(in: self, title: "5 Seconds") {
            UNService.shared.timerRequest(with: 5)
        }
    }
    
    @IBAction func didTapDate(_ sender: UIButton) {
        AlertService.actionSheet(in: self, title: "Some future time") {
            var components = DateComponents()
            components.second = 0
            UNService.shared.dateRequest(with: components)
        }
    }
    
    @IBAction func didTapLocation(_ sender: UIButton) {
        AlertService.actionSheet(in: self, title: "When I return") {
        }
    }
}

