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
        iv.setDimension(width: 34, height: 34)
        iv.centerX(withView: view)
        iv.centerY(withView: view)
        iv.layer.cornerRadius = 34 / 2
        iv.clipsToBounds = true
        
        return view
    }()
    
    lazy var actionFloatingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "AddPost"), for: .normal)
        button.backgroundColor = .mainBlue
        button.clipsToBounds = true
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Actions
    
    // MARK: - Helpers
    
    func configureUI() {
        configureNaviagationBar()
        configureTabBar()
        
        view.addSubview(actionFloatingButton)
        actionFloatingButton.anchor(bottom: view.bottomAnchor, right: view.rightAnchor, paddingBottom: tabBar.frame.height + 46, paddingRight: 10)
        actionFloatingButton.setDimension(width: 56, height: 56)
        actionFloatingButton.layer.cornerRadius = 56 / 2
    }
    
    func configureNaviagationBar() {
        navigationItem.titleView = logoImageView
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Settings")?.withRenderingMode(.alwaysOriginal), style: .plain, target: nil, action: nil)
    }
    
    func configureTabBar() {
        self.delegate = self
        
        let home = tabBarItemTemplate(controller: HomeController(collectionViewLayout: UICollectionViewFlowLayout()), imageName: "Home")
        let search = tabBarItemTemplate(controller: ExploreController(), imageName: "Search")
        let community = tabBarItemTemplate(controller: CommunityController(), imageName: "Community")
        let notification = tabBarItemTemplate(controller: NotificationController(), imageName: "Notification")
        let message = tabBarItemTemplate(controller: MessageController(), imageName: "Message")
        
        viewControllers = [home, search, community, notification, message]
    }
    
    func tabBarItemTemplate(controller: UIViewController, imageName: String) -> UIViewController {
        let controller = controller
        controller.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "Selected")
        return controller
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let index = tabBarController.selectedIndex
        
        if index != 1 {
            self.navigationItem.titleView = logoImageView
        }
        
        switch index {
        case 2:
            self.navigationItem.titleView = nil
            self.navigationItem.title = "커뮤니티"
        case 3:
            self.navigationItem.titleView = nil
            self.navigationItem.title = "알림"
        case 4:
            self.navigationItem.titleView = nil
            self.navigationItem.title = "쪽지"
            self.actionFloatingButton.setImage(UIImage(named: "AddMessage"), for: .normal)
        default:
            break
        }
    }
}
