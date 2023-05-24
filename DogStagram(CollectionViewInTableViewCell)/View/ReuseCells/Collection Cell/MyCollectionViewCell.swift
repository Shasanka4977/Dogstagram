//
//  MyCollectionViewCell.swift
//  DogStagram
//
//  Created by Shasanka Sahoo on 08/01/21.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private(set) weak var myLabel:UILabel!
    @IBOutlet private(set) weak var myImageView:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with model: AnimalModel){
        self.myLabel.text = model.name
        let imageUrl = URL(string: model.image)!
        AppUtils.RenderImage(imageAt: imageUrl, to: self.myImageView.frame.size, defaultImage: "Gradient") { image in
            self.myImageView.image = image
        }
    }
}
