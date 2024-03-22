//
//  MessageCell.swift
//  XClone
//
//  Created by 진현식 on 3/20/24.
//

import UIKit

class MessageCell: UITableViewCell {
    
    // MARK: - Properties

    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "DefaultProfileImage")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let userInfoLabel: UILabel = {
        let label = UILabel()
        
        var attriburedText = NSMutableAttributedString(string: "Hyeonsik ", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        attriburedText.append(NSAttributedString(string: "@hyeonsik", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.navyGray]))
        attriburedText.append(NSAttributedString(string: "∙1초", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.systemGray]))
        label.attributedText = attriburedText
        
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = UIColor.navyGray
        label.numberOfLines = 1
        label.text = "안녕하세요"
        return label
    }()
    
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
        addSubview(profileImageView)
        profileImageView.setDimension(width: 52, height: 52)
        profileImageView.layer.cornerRadius = 52 / 2
        profileImageView.anchor(left: leftAnchor, paddingLeft: 10)
        profileImageView.centerY(withView: self)
        
        let stack = UIStackView(arrangedSubviews: [userInfoLabel, contentLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 1
        
        addSubview(stack)
        stack.anchor(top: profileImageView.topAnchor, left: profileImageView.rightAnchor, paddingLeft: 6)
    }
}
