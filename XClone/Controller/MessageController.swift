//
//  MessageController.swift
//  XClone
//
//  Created by 진현식 on 3/17/24.
//

import UIKit

class MessageController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        guard let mainTabBarController = UIApplication.shared.firstKeyWindow?.rootViewController?.children.first
                as? MainTabBarController else { return }
        mainTabBarController.actionFloatingButton.setImage(UIImage(named: "AddPost"), for: .normal)
    }
    
    // MARK: - Actions
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .purple
    }
}
