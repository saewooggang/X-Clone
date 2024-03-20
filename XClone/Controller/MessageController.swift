//
//  MessageController.swift
//  XClone
//
//  Created by 진현식 on 3/17/24.
//

import UIKit

private let reuseIdentifier = "MessageCell"

class MessageController: UITableViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        guard let mainTabBarController = UIApplication.shared.firstKeyWindow?.rootViewController?.children.first
                as? MainTabBarController else { return }
        mainTabBarController.actionFloatingButton.setImage(UIImage(named: "AddPost"), for: .normal)
    }
    
    // MARK: - Actions
    
    @objc func handleSearchBarTapped() {
        
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .systemBackground
    }
    
    func configureTableView() {
        tableView.register(MessageCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 70
    }
}

// MARK: - UITableViewDatasource / Delegate

extension MessageController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MessageCell
        return cell
    }
}
