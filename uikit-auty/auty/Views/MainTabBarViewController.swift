//
//  MainTabBarViewController.swift
//  auty
//
//  Created by Tin on 23/01/2024.
//

import UIKit
import SwiftUI

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        adjustTabBarHeight()
        customizeTabBarAppearance()
    }
    
    func adjustTabBarHeight() {
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .systemGray
        tabBar.frame = CGRect(x: 0, y: view.frame.height - 160, width: view.bounds.width, height:200)
        tabBar.backgroundColor = .white
        for item in tabBar.items ?? [] {
            item.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -50)
        }
        
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.layer.cornerRadius = 30
        tabBar.layer.masksToBounds = true
    }
    
    // MARK: - Tab Setup
    private func setupTabs() {
        let home = self.createNav(with: "Home", and: UIImage(named: "HomeIcon"), viewController: HomeViewController())
        let course = self.createNav(with: "Course", and: UIImage(named: "CourseIcon"), viewController: CourseViewController())
        let cart = self.createNav(with: "Cart", and: UIImage(named: "CartIcon"), viewController: CartViewController())
        let profile = self.createNav(with: "Profile", and: UIImage(named: "ProfileIcon"), viewController: ProfileViewController())
        
        self.setViewControllers([home, course, cart, profile], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, viewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: viewController)
        let largerImage = image?.resized(to: 30)
        nav.tabBarItem.title = nil
        nav.tabBarItem.image = largerImage
        nav.tabBarItem.selectedImage = largerImage
        nav.tabBarItem.title = title
        nav.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22)], for: .normal)
        nav.viewControllers.first?.navigationItem.title = title + " Controller"
        nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Button", style: .plain, target: nil, action: nil)
        return nav
    }
    
    private func customizeTabBarAppearance() {
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -5)
        tabBar.layer.shadowRadius = 4
        tabBar.layer.masksToBounds = false
    }
}
// -MARK: Preview
struct MainViewControllerPreview: PreviewProvider {
    static var previews: some View {
        VCPreview {
            let mainViewController = MainTabBarViewController()
            return mainViewController
        }
    }
}
