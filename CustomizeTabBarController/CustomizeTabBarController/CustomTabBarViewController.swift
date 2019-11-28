//
//  CustomTabBarViewController.swift
//  CustomizeTabBarController
//
//  Created by he.wu on 2019/11/28.
//  Copyright © 2019 He Wu. All rights reserved.
//

import UIKit

class CustomTabBarViewController: UITabBarController {
    private let centerButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCenterButton()
        configureTabBarItems()
    }
    
    private func configureCenterButton() {
        centerButton.backgroundColor = .yellow
        centerButton.layer.cornerRadius = 25
        centerButton.addTarget(self, action: #selector(tapCenterButton(_:)), for: .touchUpInside)
        
        view.addSubview(centerButton)
        centerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            centerButton.centerYAnchor.constraint(equalTo: tabBar.topAnchor),
            centerButton.widthAnchor.constraint(equalToConstant: 50),
            centerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureTabBarItems() {
        tabBar.tintColor = .black
        
        let firstViewController = FirstViewController()
        firstViewController.title = "First"
        
        let secondViewController = SecondViewController()
        secondViewController.title = "Second"
        
        var viewControllers = [UIViewController]()
        for viewController in [firstViewController, secondViewController] {
            viewControllers.append(UINavigationController(rootViewController: viewController))
        }
        setViewControllers(viewControllers, animated: true)
    }
    
    @objc
    private func tapCenterButton(_ sender: UIButton) {
        let centerViewController = CenterViewController()
        centerViewController.hidesBottomBarWhenPushed = true
        (selectedViewController as? UINavigationController)?.pushViewController(centerViewController, animated: true)
    }
}
