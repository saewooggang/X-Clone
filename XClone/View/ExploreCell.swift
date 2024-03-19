//
//  ExploreCell.swift
//  XClone
//
//  Created by 진현식 on 3/19/24.
//

import UIKit

class ExploreCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let trendInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .systemGray
        label.text = "대한민국에서 트렌드 중"
        return label
    }()
    
    private let trendContentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "진현식"
        return label
    }()
    
    private let trendPostsCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .systemGray
        label.text = "25,389 posts"
        return label
    }()
    
    private lazy var moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "More"), for: .normal)
        button.tintColor = .systemGray3
        button.addTarget(self, action: #selector(handleMoreTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Actions
    
    @objc func handleMoreTapped() {
        print(#function)
    }
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        selectionStyle = .none
        
        let stack = UIStackView(arrangedSubviews: [trendInfoLabel, trendContentLabel, trendPostsCountLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 3
        
        contentView.addSubview(stack)
        stack.centerY(withView: self, paddingLeft: 10)
        
        contentView.addSubview(moreButton)
        moreButton.setDimension(width: 18, height: 18)
        moreButton.anchor(top: stack.topAnchor, right: rightAnchor, paddingRight: 10)
    }
}
