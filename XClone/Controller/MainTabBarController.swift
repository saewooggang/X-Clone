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
    
    private lazy var profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "DefaultProfileImage")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleProfileImageTapped))
        iv.isUserInteractionEnabled = true
        iv.addGestureRecognizer(tap)
        
        return iv
    }()
    
    lazy var actionFloatingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "AddPost"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .mainBlue
        button.clipsToBounds = true
        
        button.addTarget(self, action: #selector(handleFloatingButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Action
    
    @objc func handleProfileImageTapped() {
        let controller = ProfileController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func handleFloatingButtonTapped() {
        let controller = PostUploadController()
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    
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
        
        profileImageView.setDimension(width: 34, height: 34)
        profileImageView.layer.cornerRadius = 34 / 2
        
        let leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
        
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Settings")?.withRenderingMode(.alwaysOriginal), style: .plain, target: nil, action: nil)
    }
    
    func configureTabBar() {
        self.delegate = self
        
        let home = tabBarItemTemplate(controller: HomeController(collectionViewLayout: UICollectionViewFlowLayout()), imageName: "Home")
        let search = tabBarItemTemplate(controller: ExploreController(), imageName: "Search")
        let community = tabBarItemTemplate(controller: CommunityController(collectionViewLayout: UICollectionViewFlowLayout()), imageName: "Community")
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
            self.actionFloatingButton.setImage(UIImage(named: "AddMessage")?.withRenderingMode(.alwaysTemplate), for: .normal)
        default:
            break
        }
    }
}
