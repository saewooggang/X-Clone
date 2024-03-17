//
//  MainTabBarController.swift
//  XClone
//
//  Created by 진현식 on 3/17/24.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    // MARK: - Properties
    
    private let logoImageView: UIView = {
        let view = UIView()
        
        let iv = UIImageView(image: UIImage(named: "Logo"))
        iv.contentMode = .scaleAspectFit
        
        view.addSubview(iv)
        iv.setDimension(width: 30, height: 30)
        iv.centerX(withView: view)
        iv.centerY(withView: view)
        
        return view
    }()
    
    private let profileImageView: UIView = {
        let view = UIView()
        
        let iv = UIImageView()
        iv.image = UIImage(named: "DefaultProfileImage")
        iv.contentMode = .scaleAspectFill
        
        view.addSubview(iv)
        iv.setDimension(width: 38, height: 38)
        iv.centerX(withView: view)
        iv.centerY(withView: view)
        iv.layer.cornerRadius = 38 / 2
        iv.clipsToBounds = true
        
        return view
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNaviagationBar()
        configureTabBar()
    }
    
    // MARK: - Actions
    
    // MARK: - Helpers
    
    func configureNaviagationBar() {
        navigationItem.titleView = logoImageView
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Settings")?.withRenderingMode(.alwaysOriginal), style: .plain, target: nil, action: nil)
    }
    
    func configureTabBar() {
        let home = tabBarItemTemplate(controller: HomeController(), imageName: "Home")
        let search = tabBarItemTemplate(controller: SearchController(), imageName: "Search")
        let community = tabBarItemTemplate(controller: CommunityController(), imageName: "Community")
        let notification = tabBarItemTemplate(controller: NotificationController(), imageName: "Notification")
        let message = tabBarItemTemplate(controller: MessageController(), imageName: "Message")
        
        viewControllers = [home, search, community, notification, message]
    }
    
    func tabBarItemTemplate(controller: UIViewController, imageName: String) -> UIViewController {
        let controller = controller
        controller.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        return controller
    }
}
