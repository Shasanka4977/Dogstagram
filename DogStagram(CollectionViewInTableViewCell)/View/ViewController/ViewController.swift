//
//  ViewController.swift
//  DogStagra
//
//  Created by Shasanka Sahoo on 08/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private(set) weak var tableView: UITableView!
    
    var models: [AnimalModel] = []
    private(set) var Image: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTableView()
        self.setDataForCollectionView()
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight(tableView, heightForRowAt: indexPath)
    }
}

extension ViewController:  UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfItems(tableView, numberOfRowsInSection: section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getCell(tableView, cellForRowAt: indexPath)
    }
}

extension ViewController: CollectionTableViewCellDelegate {
    func didSelectCell(image: String) {
        self.Image = image
        self.performSegue(withIdentifier: "ViewFullScreenSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let VC = segue.destination as? FullScreenViewController {
            VC.image = Image
        }
    }
}

private extension ViewController {
    
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CollectionTableViewCell.cellNib, forCellReuseIdentifier: CollectionTableViewCell.defaultIdentifier)
    }
    
    func setDataForCollectionView() {
        let animalNames = AnimalModel.animalNames
        let animalImages = AnimalModel.animalImages
        models = zip(animalNames, animalImages).map {
            AnimalModel(name: $0, image: $1)
        }
    }
    
    func getCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: CollectionTableViewCell.self, indexPath: indexPath)
        cell.models = models
        cell.delegate = self
        return cell
    }
    
    func numberOfItems(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func rowHeight(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
}
