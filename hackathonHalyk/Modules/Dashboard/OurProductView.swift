//
//  OurProductView.swift
//  hackathonHalyk
//
//  Created by Nariman on 27.01.2024.
//

/*
 
 import UIKit
 import SnapKit


 struct ActionViewModel {
     let image: UIImage
     let text: String
 }

 class ActionsTableView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
     
     var buttonHandler: (() -> ())?
     var alertButtonHandler: (() -> ())?
     
     let elements: [ActionViewModel] = [
         .init(image: UIImage(named: "action2") ?? UIImage(), text: "Завявки"),
         .init(
             image: UIImage(systemName: "heart.fill") ?? UIImage(),
             text: "НАША ФИЧА"
         ),
         .init(image: UIImage(named: "action3") ?? UIImage(), text: "Карта"),
         .init(image: UIImage(named: "action5") ?? UIImage(), text: "Страховой \n случаи"),
         .init(image: UIImage(named: "action4") ?? UIImage(), text: "Оплатить"),
         .init(image: UIImage(named: "action6") ?? UIImage(), text: "Мои \n полисы"),
     ]
     
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         elements.count
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActionCollectionViewCell.id, for: indexPath) as! ActionCollectionViewCell
         
         cell.configure(title: elements[indexPath.row].text, image: elements[indexPath.row].image)
         
         return cell
     }
     
     
     lazy var collectionView: UICollectionView = {
         let layout = UICollectionViewFlowLayout()
         let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
         return collectionView
     }()

     
     override init(frame: CGRect) {
         super.init(frame: frame)
         collectionView.backgroundColor = .white
         
         setupUI()
         backgroundColor = .systemGray6
         layer.cornerRadius = 18
         clipsToBounds = true
         collectionView.register(
             ActionCollectionViewCell.self,
             forCellWithReuseIdentifier:ActionCollectionViewCell.id
         )
         collectionView.dataSource = self
         collectionView.delegate = self
         
         addSubview(collectionView)
         collectionView.snp.makeConstraints { make in
             make.top.equalToSuperview()
             make.bottom.equalToSuperview()
             make.leading.trailing.equalToSuperview().inset(-16)
         }
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     
     func collectionView(
         _ collectionView: UICollectionView,
         layout collectionViewLayout: UICollectionViewLayout,
         sizeForItemAt indexPath: IndexPath
     ) -> CGSize {
         let numberOfColumns: CGFloat = 3
         let itemWidth = collectionView.frame.width / numberOfColumns
         let itemHeight = collectionView.frame.height / 2
         return CGSize(width: itemWidth, height: itemHeight)
     }
     
     func collectionView(
         _ collectionView: UICollectionView,
         didSelectItemAt indexPath: IndexPath
     ) {
         
         if indexPath.row == 1 {
             let vc = WebViewViewController()
             if let navigationController = self.window?.rootViewController as? UINavigationController {
                 navigationController.pushViewController(vc, animated: true)
                 
             } else {
                 alertButtonHandler?()
             }
             
         }
     }
 }

 private extension ActionsTableView {
     func setupUI() {
         
     }
     
     private func createLayout() -> UICollectionViewLayout {
         let spacing: CGFloat = 25
         let itemSize = NSCollectionLayoutSize(
             widthDimension: .fractionalWidth(1.0),
             heightDimension: .fractionalHeight(1.0))
         let item = NSCollectionLayoutItem(layoutSize: itemSize)

         let groupSize = NSCollectionLayoutSize(
             widthDimension: .fractionalWidth(1.0),
             heightDimension: .absolute(44))
         let group = NSCollectionLayoutGroup.horizontal(
             layoutSize: groupSize,
             subitem: item, count: 3
         )
         group.interItemSpacing = .fixed(spacing)

         let section = NSCollectionLayoutSection(group: group)
         section.contentInsets = .init(
             top: 20,
             leading: 30,
             bottom: 40,
             trailing: 30
         )
         section.interGroupSpacing = spacing

         let layout = UICollectionViewCompositionalLayout(section: section)
         return layout
     }
 }

 
 */

import UIKit

private struct OurProductViewModel {
}

final class OurProductView: UIView {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Наши Продукты"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .medium)
       return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
}

