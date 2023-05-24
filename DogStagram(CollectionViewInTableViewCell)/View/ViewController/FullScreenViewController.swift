//
//  FullScreenViewController.swift
//  DogStagram
//
//  Created by Shasanka Sahoo on 24/05/23.
//

import UIKit

class FullScreenViewController: UIViewController {

    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    var image: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ImageUrl = URL(string: image ?? "Gradient")!
        AppUtils.RenderImage(imageAt: ImageUrl, to: self.imageViewOutlet.frame.size, defaultImage: "Gradient") { image in
            self.imageViewOutlet.image = image
        }
    }
}
