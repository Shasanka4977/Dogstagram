//
//  UITableView.swift
//  DogStagram
//
//  Created by Shasanka Sahoo on 24/05/23.
//

import UIKit

public extension UITableView {
    
    /** Shortcut: Dequeue a cell with his default Class Name. Example: MyCustomCell.self */
    func dequeue<T: UITableViewCell>(cellClass: T.Type, indexPath: IndexPath) -> T {
        return self.dequeue(withIdentifier: cellClass.defaultIdentifier, indexPath: indexPath)
    }
    
    /** Dequeue a cell with automatic casting */
    private func dequeue<T: UITableViewCell>(withIdentifier id: String, indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: id, for: indexPath) as! T
    }
}
