//
//  ProfileHeader.swift
//  XClone
//
//  Created by 진현식 on 3/21/24.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
    
    // MARK: - Properties
    
    private let backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "TestProfieBackgroundImage")
        iv.backgroundColor = .black
        return iv
    }()
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        let image = UIImage(named: "DefaultProfileImage")
        iv.image = image
        iv.contentMode = .scaleAspectFit
        iv.layer.borderColor = UIColor.systemBackground.cgColor
        iv.layer.borderWidth = 3
        iv.clipsToBounds = true
        return iv
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hyeonsik Jin"
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private let userIdLabel: UILabel = {
        let label = UILabel()
        label.text = "@hyeonsik"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .systemGray
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Bio Label Test Bio Label Test Bio Label Test Bio Label Test Bio Label Test Bio Label TestBio Label Test"
        return label
    }()
    
    private lazy var addressView = makeUserInfoLabel(withText: "San Francisco, CA", imageName: "Location")
    private lazy var linkView = makeUserInfoLabel(withText: "tesla.com", imageName: "Link")
    private lazy var brithView = makeUserInfoLabel(withText: "2024년 3월 21일에 가입함", imageName: "Calendar")
    
    private lazy var followingLabel = makeFollowInfoLabel(withValue: 100, text: "팔로잉")
    private lazy var followersLabel = makeFollowInfoLabel(withValue: 99, text: "팔로워")
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        conigureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func conigureUI() {
        addSubview(backgroundImageView)
        backgroundImageView.setDimension(width: frame.width, height: 100)
        backgroundImageView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
        
        addSubview(profileImageView)
        profileImageView.setDimension(width: 62, height: 62)
        profileImageView.layer.cornerRadius = 62 / 2
        profileImageView.anchor(top: backgroundImageView.bottomAnchor, left: leftAnchor, paddingTop: -26, paddingLeft: 10)
        
        let nameStack = UIStackView(arrangedSubviews: [usernameLabel, userIdLabel])
        nameStack.axis = .vertical
        nameStack.spacing = 2
        
        addSubview(nameStack)
        nameStack.anchor(top: profileImageView.bottomAnchor, left: profileImageView.leftAnchor, paddingTop: 5)
        
        addSubview(bioLabel)
        bioLabel.anchor(top: nameStack.bottomAnchor, left: nameStack.leftAnchor, right: rightAnchor, paddingTop: 10, paddingRight: 10)
        
        let detailStack = UIStackView(arrangedSubviews: [addressView, linkView])
        detailStack.distribution = .fillEqually
        detailStack.spacing = 16
    
        addSubview(detailStack)
        detailStack.anchor(top: bioLabel.bottomAnchor, left: bioLabel.leftAnchor, paddingTop: 10, paddingLeft: -2.8)
        
        addSubview(brithView)
        brithView.anchor(top: detailStack.bottomAnchor, left: detailStack.leftAnchor, paddingTop: 6)
        
        let followStack = UIStackView(arrangedSubviews: [followingLabel, followersLabel])
        followStack.spacing = 10
        
        addSubview(followStack)
        followStack.anchor(top: brithView.bottomAnchor, left: bioLabel.leftAnchor, paddingTop: 8)
        
        addSubview(separatorView)
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorView.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    
    func makeUserInfoLabel(withText text: String, imageName: String) -> UIView {
        let view = UIView()
        
        let iv = UIImageView()
        let image = UIImage(named: imageName + "ProfileHeaderImage")?.withRenderingMode(.alwaysTemplate)
        iv.image = image
        iv.tintColor = .systemGray
        iv.contentMode = .scaleAspectFit
        
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .gray
        
        view.addSubview(iv)
        iv.setDimension(width: 18, height: 18)
        iv.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor)
        
        view.addSubview(label)
        label.anchor(top: view.topAnchor, left: iv.rightAnchor, right: view.rightAnchor, paddingTop: 1, paddingLeft: 2)
        
        return view
    }
    
    func makeFollowInfoLabel(withValue value: Int, text: String) -> UILabel {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: String(value), attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSAttributedString(string: " " + text, attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.gray]))
        label.attributedText = attributedText
        
        return label
    }
}
