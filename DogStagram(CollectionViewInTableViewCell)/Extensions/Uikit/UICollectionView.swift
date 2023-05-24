//
//  UICollectionView.swift
//  DogStagram
//
//  Created by Shasanka Sahoo on 24/05/23.
//

import UIKit

public extension UICollectionView {
    
    /** Shortcut: Dequeue a cell with his default Class Name. Example: MyCustomCell.self */
    func dequeue<T: UICollectionViewCell>(cellClass: T.Type, indexPath: IndexPath) -> T {
        return self.dequeue(withIdentifier: cellClass.defaultIdentifier, indexPath: indexPath)
    }
    
    /** Dequeue a cell with automatic casting */
    private func dequeue<T: UICollectionViewCell>(withIdentifier id: String, indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! T
    }
}
