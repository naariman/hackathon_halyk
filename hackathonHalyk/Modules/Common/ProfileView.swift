//
//  ProfileView.swift
//  hackathonHalyk
//
//  Created by Nariman on 23.01.2024.
//

import UIKit

class ProfileView: UIView {
    
    private let avatarImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = AppImage.avatar.uiImage
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let helloUserLabel: UILabel = {
       let label = UILabel()
        label.text = "Привет, Нурдана!"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private let currentDateLabel: UILabel = {
       let label = UILabel()
        label.text = "Вс, 28 января"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    private let chatImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = AppImage.chat.uiImage
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let notificationImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = AppImage.notification.uiImage
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(avatarImageView)
        avatarImageView.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.size.equalTo(44)
        }
        
        addSubview(helloUserLabel)
        helloUserLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(8)
        }
        
        addSubview(currentDateLabel)
        currentDateLabel.snp.makeConstraints { make in
            make.leading.equalTo(helloUserLabel)
            make.bottom.equalToSuperview()
        }
        
        addSubview(notificationImageView)
        notificationImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
            make.size.equalTo(28)
        }
        
        addSubview(chatImageView)
        chatImageView.snp.makeConstraints { make in
            make.trailing.equalTo(notificationImageView.snp.trailing).offset(-48)
            make.centerY.equalToSuperview()
            make.size.equalTo(28)
        }
    }
}
