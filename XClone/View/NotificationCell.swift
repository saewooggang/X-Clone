//
//  NotificationCell.swift
//  XClone
//
//  Created by 진현식 on 3/19/24.
//

import UIKit

class NotificationCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let notificationImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "NotificationSelected")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = .mainBlue
        iv.contentMode = .scaleAspectFit
        iv.setDimension(width: 25, height: 25)
        return iv
    }()
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        let profileImage = UIImage(named: "DefaultProfileImage")
        iv.image = profileImage
        iv.backgroundColor = .systemBackground
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.setDimension(width: 37, height: 37)
        iv.layer.cornerRadius = 5
        return iv
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        
        var attributedText = NSMutableAttributedString(string: "Elon Musk", attributes: [.font: UIFont.boldSystemFont(ofSize: 15)])
        attributedText.append(NSAttributedString(string: " 님의 새 게시물 알림", attributes: [.font: UIFont.systemFont(ofSize: 15)]))
        label.attributedText = attributedText
        
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
        selectionStyle = .none
        
        let stack = UIStackView(arrangedSubviews: [profileImageView, infoLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 1
        
        addSubview(notificationImageView)
        notificationImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 10, paddingLeft: 26)
        
        addSubview(stack)
        stack.anchor(top: notificationImageView.topAnchor, left: notificationImageView.rightAnchor, bottom: bottomAnchor, paddingLeft: 6)
    }
}
