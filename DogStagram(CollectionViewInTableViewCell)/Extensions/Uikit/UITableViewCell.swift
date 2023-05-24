//
//  UITableViewCell.swift
//  DogStagram
//
//  Created by Shasanka Sahoo on 24/05/23.
//

import UIKit

public extension UITableViewCell {
    
    /** Return identifier with the same name of the subclass */
    static var defaultIdentifier: String {
        return String(describing: self)
    }
    
    static var cellNib: UINib {
        return UINib(nibName: defaultIdentifier, bundle: nil)
    }
}
