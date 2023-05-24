//
//  CollectionTableViewCell.swift
//  DogStagram
//
//  Created by Shasanka Sahoo on 08/01/21.
//

import UIKit

protocol CollectionTableViewCellDelegate: AnyObject {
    func didSelectCell(image: String)
}

class CollectionTableViewCell: UITableViewCell {
    
    @IBOutlet private(set) var collectionView:UICollectionView!
    
    weak var delegate: CollectionTableViewCellDelegate?
    var models: [AnimalModel] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCollectionView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        contentView.backgroundColor = UIColor.white
    }
}

extension CollectionTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectCell(image: models[indexPath.item].image)
    }
}

extension CollectionTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return getCell(collectionView, cellForItemAt: indexPath)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItems(collectionView, section: section)
    }
}

extension CollectionTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemHeight(collectionView, indexPath: indexPath)
    }
}

private extension CollectionTableViewCell {
    
    func itemHeight(_ collectionView: UICollectionView, indexPath: IndexPath) -> CGSize {
        let cellWidht: Int = 250
        let cellHeight: Int = 250
        return CGSize(width: cellWidht, height: cellHeight)
    }
    
    func numberOfItems(_ collectionView: UICollectionView, section: Int) -> Int {
        return models.count
    }
    
    func getCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(cellClass: MyCollectionViewCell.self, indexPath: indexPath)
        cell.configure(with: models[indexPath.row])
        return cell
    }
    
    func setUpCollectionView() {
        collectionView.register(MyCollectionViewCell.cellNib, forCellWithReuseIdentifier: MyCollectionViewCell.defaultIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
