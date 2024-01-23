//
//  ColorsDetailVC.swift
//  navigation_intro
//
//  Created by Shaxobiddin on 23/01/24.
//

import UIKit

class ColorsDetailVC: UIViewController {
    
    var color: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = color ?? .white
    }
    
    @IBAction func navigateTabBar(_ sender: UIButton) {
    }
}
