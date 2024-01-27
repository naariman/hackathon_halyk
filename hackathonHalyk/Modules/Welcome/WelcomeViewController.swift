//
//  ViewController.swift
//  hackathonHalyk
//
//  Created by Nariman on 20.01.2024.
//

import UIKit
import SnapKit

final class WelcomeViewController: UIViewController {
    
    private let logoImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "halykLife")
        return imageView
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.backgroundColor = AppColor.mainGreen.uiColor
        button.layer.cornerRadius = 20
        button.titleLabel?.font = .systemFont(ofSize: 22)
        button.addTarget(
            self,
            action: #selector(nextButtonTapped),
            for: .touchUpInside
        )
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
}

private extension WelcomeViewController {
    
    func setupUI() {
        view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(36)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
    }
    
    @objc
    func nextButtonTapped() {
        let tabBar = UITabBarController()
        tabBar.tabBar.backgroundColor = .white
        tabBar.tabBar.tintColor = AppColor.mainGreen.uiColor
        
        let dashboard     = DashboardViewController()
        dashboard.tabBarItem = .init(
            title: "Главная",
            image: UIImage(systemName: "house.fill"),
            tag: 0
        )
        let myPolicies    = MyPoliciesViewController()
        myPolicies.tabBarItem = .init(
            title: "Мои полисы",
            image: UIImage(systemName: "lock.open.fill"),
            tag: 1
        )
        let insuranceCase = InsuranceCaseViewController()
        insuranceCase.tabBarItem = .init(
            title: "Страховой случаи",
            image: UIImage(systemName: "house.fill"),
            tag: 2
        )
        let profile       = ProfileViewController()
        profile.tabBarItem = .init(
            title: "Профиль",
            image: UIImage(systemName: "profile.fill"),
            tag: 3
        )
        
        let controllersArray = [
            dashboard,
            myPolicies, 
            insuranceCase, 
            profile
        ]
        
        tabBar.viewControllers = controllersArray.map { UINavigationController.init(
            rootViewController: $0
        )}
    }
    
}
