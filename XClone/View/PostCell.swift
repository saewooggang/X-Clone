//
//  PostCell.swift
//  XClone
//
//  Created by 진현식 on 3/18/24.
//

import UIKit

protocol PostCellDelegate: AnyObject {
    func feedCellDidTapProfileImage(_ cell: PostCell)
}

enum PostCellConfigration {
    case post
    case community
}

class PostCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    weak var delegate: PostCellDelegate?
    
    var config: PostCellConfigration? {
        didSet { configureUI() }
    }
    
    private lazy var profileImageView: UIImageView = {
        let iv = UIImageView()
        let image = UIImage(named: "DefaultProfileImage")
        iv.image = image
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleProfileImageTapped))
        iv.isUserInteractionEnabled = true
        iv.addGestureRecognizer(tap)
        
        return iv
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        
        var attributedString = NSMutableAttributedString(string: "Hyeonsik Jin ", attributes: [.font: UIFont.systemFont(ofSize: 14, weight: .bold)])
        attributedString.append(NSAttributedString(string: "@hyeonsik∙2분", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))
        label.attributedText = attributedString
        
        return label
    }()
    
    private lazy var moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "More"), for: .normal)
        button.tintColor = .systemGray3
        button.addTarget(self, action: #selector(handleMoreTapped), for: .touchUpInside)
        return button
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Test Content Label Test Content Label Test Content Label Test Content Label Test Content Label Test Content Label Test Content Label Test Content Label"
        return label
    }()
    
    private lazy var commentButton: UIButton = {
        return feedButton("Comment")
    }()
    
    private lazy var retweetButton: UIButton = {
        return feedButton("Retweet")
    }()
    
    private lazy var likeButton: UIButton = {
        return feedButton("Like")
    }()
    
    private lazy var viewsButton: UIButton = {
        return feedButton("Views")
    }()
    
    private let communityNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.textColor = .systemGray
        label.text = "[공식] 테슬라 주주 커뮤니티"
        return label
    }()
    
    private let communityImageView: UIImageView = {
        let iv = UIImageView()
        let image = UIImage(named: "CommunitySelected")?.withRenderingMode(.alwaysTemplate)
        iv.image = image
        iv.tintColor = .systemGray
        iv.setDimension(width: 16, height: 16)
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    
    // MARK: - Actions
    
    @objc func handleMoreTapped() {
        print(#function)
    }
    
    @objc func handleProfileImageTapped() {
        delegate?.feedCellDidTapProfileImage(self)
    }
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        if config == .community {
            addSubview(communityNameLabel)
            communityNameLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 5, paddingLeft: 62)
            
            addSubview(communityImageView)
            communityImageView.anchor(top: communityNameLabel.topAnchor, right: communityNameLabel.leftAnchor, paddingRight: 2)
        }
        
        addSubview(profileImageView)
        profileImageView.setDimension(width: 48, height: 48)
        profileImageView.layer.cornerRadius = 48 / 2
        profileImageView.anchor(top: config == .post ? topAnchor : communityNameLabel.bottomAnchor, left: leftAnchor, paddingTop: config == .post ? 10 : 2, paddingLeft: 10)
        
        addSubview(infoLabel)
        infoLabel.anchor(top: profileImageView.topAnchor, left: profileImageView.rightAnchor, paddingLeft: 5)
        
        addSubview(moreButton)
        moreButton.setDimension(width: 18, height: 18)
        moreButton.anchor(top: profileImageView.topAnchor, right: rightAnchor, paddingRight: 10)
        
        addSubview(contentLabel)
        contentLabel.anchor(top: infoLabel.bottomAnchor, left: infoLabel.leftAnchor, right: rightAnchor, paddingTop: 3, paddingBottom: 5, paddingRight: 5)
        
        addSubview(separatorView)
        separatorView.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        let stack = UIStackView(arrangedSubviews: [commentButton, retweetButton, likeButton, viewsButton])
        stack.distribution = .equalSpacing
        
        addSubview(stack)
        stack.anchor(left: contentLabel.leftAnchor, bottom: bottomAnchor, right: moreButton.rightAnchor, paddingBottom: 10, paddingRight: 20)
    }
    
    func feedButton(_ imageName: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.contentMode = .scaleAspectFit
        button.setDimension(width: 20, height: 20)
        button.tintColor = .systemGray
        
        let countLabel = UILabel()
        countLabel.text = "19"
        countLabel.textColor = .systemGray
        countLabel.font = .systemFont(ofSize: 12)
        
        button.addSubview(countLabel)
        countLabel.centerY(withView: button, paddingLeft: 23)
        
        return button
    }
}
