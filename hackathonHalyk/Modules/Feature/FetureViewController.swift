//
//  FetureViewController.swift
//  hackathonHalyk
//
//  Created by Nariman on 27.01.2024.
//

import UIKit

final class FeatureViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupNavigationBar()
        setupUI()
    }
    
    
}

private extension FeatureViewController {
    
    func setupUI() {
        title = "XYZ"
    }
    
    func setupNavigationBar() {
        let backItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        backItem.tintColor = .black
        navigationItem.leftBarButtonItem = backItem
    }
    
    @objc
    func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}


extension FeatureViewController {
    
}
