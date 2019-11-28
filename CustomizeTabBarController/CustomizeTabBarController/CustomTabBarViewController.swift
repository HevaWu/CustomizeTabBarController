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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.bringSubviewToFront(centerButton)
        centerButton.center = CGPoint(x: tabBar.center.x, y: tabBar.frame.origin.y)
        centerButton.layer.zPosition = 1
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
        
        let itemCount: CGFloat = 2
        let itemSpacing: CGFloat = view.frame.width / (itemCount + 1)
        let itemWidth: CGFloat = (view.frame.width - itemSpacing - 1) / CGFloat(itemCount)
        
        let appearance = tabBar.standardAppearance
        
        appearance.stackedItemSpacing = itemSpacing
        appearance.stackedItemWidth = itemWidth
        appearance.stackedItemPositioning = .centered
        
        tabBar.standardAppearance = appearance
        
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
