//
//  ViewController.swift
//  CustomizeTabBarController
//
//  Created by he.wu on 2019/11/25.
//  Copyright © 2019 He Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func tapButton(_ sender: Any) {
        let customTabBarController = CustomTabBarViewController()
        present(customTabBarController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

