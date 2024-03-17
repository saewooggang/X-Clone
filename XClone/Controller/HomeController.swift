//
//  HomeController.swift
//  XClone
//
//  Created by 진현식 on 3/17/24.
//

import UIKit

class HomeController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Actions
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .systemBackground
    }
}