//
//  ActionCollectionViewCell.swift
//  hackathonHalyk
//
//  Created by Nariman on 26.01.2024.
//

import UIKit
import SnapKit

class ActionCollectionViewCell: UICollectionViewCell {
    
    static let id = "id"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemPink
        return imageView
    }()
    
    private let titileLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.size.equalTo(26)
        }
        
        contentView.addSubview(titileLabel)
        titileLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, image: UIImage) {
        imageView.image = image 
        titileLabel.text = title
    }
}
