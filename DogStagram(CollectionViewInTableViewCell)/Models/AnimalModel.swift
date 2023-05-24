//
//  AnimalModel.swift
//  DogStagram
//
//  Created by Shasanka Sahoo on 24/05/23.
//

import Foundation

struct AnimalModel {
    
    let name: String
    let image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
    
    static let animalNames = ["Bulldog", "Husky", "Labrador", "Pomeranian", "Pug"]
    static let animalImages = ["https://images.pexels.com/photos/1503537/pexels-photo-1503537.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", "https://images.pexels.com/photos/803766/pexels-photo-803766.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", "https://images.pexels.com/photos/2253275/pexels-photo-2253275.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", "https://images.pexels.com/photos/2694561/pexels-photo-2694561.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", "https://images.pexels.com/photos/1591939/pexels-photo-1591939.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"]
}
