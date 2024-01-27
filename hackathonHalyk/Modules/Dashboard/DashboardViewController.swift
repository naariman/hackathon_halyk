//
//  DashboardViewController.swift
//  hackathonHalyk
//
//  Created by Nariman on 23.01.2024.
//

import UIKit

final class DashboardViewController: UIViewController {
    
    private let profileView: ProfileView = .init(frame: .zero)
    private let bannersCollectionView: BannersTableView = .init(frame: .zero)
    private let actionView: ActionsTableView = .init(frame: .zero)
    
    private let label: UILabel = {
       let label = UILabel()
        label.textColor = .lightGray
        label.text = "Developing process..."
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32, weight: .semibold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

private extension DashboardViewController {
    
    func setupUI() {
        view.backgroundColor = AppColor.main.uiColor
        
        view.addSubview(profileView)
        profileView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(65)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(44)
        }
        
        view.addSubview(bannersCollectionView)
        bannersCollectionView.clipsToBounds = true
        bannersCollectionView.snp.makeConstraints { make in
            make.top.equalTo(profileView.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(140)
        }
        
        view.addSubview(actionView)
        actionView.snp.makeConstraints { make in
            make.top.equalTo(bannersCollectionView.snp.bottom).offset(32)
            make.height.equalTo(190)
            make.leading.trailing.equalToSuperview().inset(16)
        }
       
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalTo(actionView.snp.bottom).offset(32)
            make.height.equalTo(200)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-100)
            make.centerX.equalToSuperview()
        }
        
    }
    
    @objc
    func opentg() {
        let botURL = URL.init(string: "https://t.me/\("BotFather")")

            if UIApplication.shared.canOpenURL(botURL!) {
                UIApplication.shared.openURL(botURL!)
            } else {
                let urlAppStore = URL(string: "itms-apps://itunes.apple.com/app/id686449807")
                if(UIApplication.shared.canOpenURL(urlAppStore!))
                {
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(urlAppStore!, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(urlAppStore!)
                    }
                }
            }
    }
    
}
