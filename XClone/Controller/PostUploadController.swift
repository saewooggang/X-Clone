//
//  PostUploadController.swift
//  XClone
//
//  Created by 진현식 on 3/22/24.
//

import UIKit

class PostUploadController: UIViewController {
    
    // MARK: - Properties
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        let image = UIImage(named: "DefaultProfileImage")
        iv.image = image
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    private let uploadButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("게시하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.backgroundColor = .mainBlue
        button.clipsToBounds = true
        return button
    }()
    
    private let audienceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("모든 사람", for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.mainBlue.cgColor
        button.clipsToBounds = true
        
        let chevronImage = UIImage(systemName: "chevron.down")
        let iv = UIImageView(image: chevronImage)
        iv.contentMode = .scaleAspectFit
        
        button.addSubview(iv)
        iv.setDimension(width: 18, height: 18)
        iv.anchor(left: button.titleLabel?.rightAnchor)
        
        return button
    }()
    
    private lazy var audienceView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.mainBlue.cgColor
        view.clipsToBounds = true
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.textColor = .mainBlue
        label.text = "모든 사람"
        
        let chevronImage = UIImage(systemName: "chevron.down")
        let iv = UIImageView(image: chevronImage)
        iv.contentMode = .scaleAspectFit
        iv.setDimension(width: 16, height: 16)
        
        let stack = UIStackView(arrangedSubviews: [label, iv])
        
        view.addSubview(stack)
        stack.centerX(withView: view)
        stack.centerY(withView: view)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleShowSetupAudience))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
        
        return view
    }()
    
    private let testIv: UIImageView = {
        let chevronImage = UIImage(systemName: "chevron.down")
        let iv = UIImageView(image: chevronImage)
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let inputTextView = InputTextView()
    
    // MARK: - Actions
    
    @objc func handleDismissal() {
        dismiss(animated: true)
    }
    
    @objc func handleShowSetupAudience() {
        print(#function)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNavigationBar()
    }
    
    // MARK: - Heplers
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(profileImageView)
        profileImageView.setDimension(width: 38, height: 38)
        profileImageView.layer.cornerRadius = 38 / 2
        profileImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingLeft: 10)
        
        view.addSubview(audienceView)
        audienceView.setDimension(width: 86, height: 24)
        audienceView.layer.cornerRadius = 24 / 2
        audienceView.anchor(left: profileImageView.rightAnchor, paddingLeft: 10)
        audienceView.centerY(withView: profileImageView)
        
        view.addSubview(inputTextView)
        inputTextView.anchor(top: audienceView.bottomAnchor, left: audienceView.leftAnchor, right: view.rightAnchor, paddingRight: 10)
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.tintColor = .black
        
        uploadButton.setDimension(width: 82, height: 34)
        uploadButton.layer.cornerRadius = 34 / 2
        let rightBarButton = UIBarButtonItem(customView: uploadButton)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(handleDismissal))
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
}
