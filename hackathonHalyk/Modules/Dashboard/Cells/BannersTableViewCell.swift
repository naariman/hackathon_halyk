//
//  BannersTableViewCell.swift
//  hackathonHalyk
//
//  Created by Nariman on 24.01.2024.
//

import UIKit

private struct Constants {
    static let images: [UIImage] = [
        UIImage(named: "baner1") ?? UIImage(),
        UIImage(named: "baner3") ?? UIImage(),
        UIImage(named: "baner2") ?? UIImage(),

    ]
}

class BannersTableView: UIView {
    
    static let id = "BannersTableViewCell"
    
    let cellWidth = (3 / 4) * UIScreen.main.bounds.width
    let cellHeight = ((3 / 4) * UIScreen.main.bounds.width) / 2
    let sectionSpacing = (1 / 8) * UIScreen.main.bounds.width
    let cellSpacing = (1 / 16) * UIScreen.main.bounds.width
    
    let colors: [UIColor] = [.red, .green, .blue, .purple, .orange, .black, .cyan]
    let cellId = "cell id"
    
    // MARK: - UI Components
    
    lazy var collectionView: UICollectionView = {
        let layout = PagingCollectionViewLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: sectionSpacing, bottom: 0, right: sectionSpacing)
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        layout.minimumLineSpacing = cellSpacing
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.decelerationRate = .fast
        collectionView.dataSource = self
        collectionView.backgroundColor = AppColor.main.uiColor
        return collectionView
    }()
    
    // MARK: - Setup
    
    private func design() {
        backgroundColor = AppColor.main.uiColor
    }
    
    private func registerCollectionViewCells() {
        collectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.id)
    }
    
    private func applyConstraints() {
        addSubview(collectionView)
        collectionView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: cellWidth).isActive = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        design()
        registerCollectionViewCells()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BannersTableView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Constants.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.id, for: indexPath) as! BannerCollectionViewCell
        let banners = Constants.images

        cell.configure(image: banners[indexPath.row])
        
        return cell
    }
    
}
