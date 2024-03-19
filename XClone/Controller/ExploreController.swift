//
//  ExploreController.swift
//  XClone
//
//  Created by 진현식 on 3/17/24.
//

import UIKit

private let reuseIdentifier = "ExploreCell"

class ExploreController: UITableViewController {
    
    // MARK: - Properties
    
    private lazy var searchBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleSearchBarTapped))
        view.addGestureRecognizer(tap)
        
        let iv = UIImageView()
        iv.image = UIImage(named: "Search")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = .systemGray
        
        let label = UILabel()
        label.text = "검색"
        label.textColor = .systemGray
        
        let stack = UIStackView(arrangedSubviews: [iv, label])
        stack.spacing = 2
        stack.distribution = .equalCentering
        stack.alignment = .center
        
        view.addSubview(stack)
        stack.centerX(withView: view)
        stack.anchor(top: view.topAnchor, paddingTop: 8)
        
        return view
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        connfigureNavigationBar()
    }
    
    // MARK: - Actions
    
    @objc func handleSearchBarTapped() {
        print(#function)
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        
        searchBarView.setDimension(width: 280, height: 44)
        searchBarView.clipsToBounds = true
        searchBarView.layer.cornerRadius = 20
    }
    
    func configureTableView() {
        tableView.register(ExploreCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 80
        tableView.separatorStyle = .none
    }
    
    func connfigureNavigationBar() {
        guard let mainTabBarContrller = UIApplication.shared.firstKeyWindow?.rootViewController?.children.first else { return }
        mainTabBarContrller.navigationItem.titleView = searchBarView
    }
}

// MARK: - UITableViewDatasource / Delegate

extension ExploreController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ExploreCell
        return cell
    }
}
