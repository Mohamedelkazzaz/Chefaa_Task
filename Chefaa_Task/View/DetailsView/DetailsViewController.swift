//
//  DetailsViewController.swift
//  Chefaa_Task
//
//  Created by Mohamed Elkazzaz on 26/12/2023.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var marvelImageView: UIImageView!
    @IBOutlet weak var marvelNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var comicsCollectionView: UICollectionView!
    @IBOutlet weak var seriesCollectionView: UICollectionView!
    @IBOutlet weak var storiesCollectionView: UICollectionView!
    @IBOutlet weak var eventsCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        comicsCollectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "categoryCell")
        seriesCollectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "categoryCell")
        storiesCollectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "categoryCell")
        eventsCollectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "categoryCell")
    }
    
}

extension DetailsViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == comicsCollectionView {
            return 4
        }else if collectionView == seriesCollectionView {
            return 5
        }else if collectionView == storiesCollectionView {
            return 6
        }else {
            return 7 
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == comicsCollectionView {
            let cell = comicsCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as!
            CategoryCell
            return cell
        }else if collectionView == seriesCollectionView {
            let cell = seriesCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as!
            CategoryCell
            return cell
        }else if collectionView == storiesCollectionView {
            let cell = storiesCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as!
            CategoryCell
            return cell
        }else {
            let cell = eventsCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as!
            CategoryCell
            return cell
        }
    }
    
    
}
