//
//  DetailsViewController.swift
//  Chefaa_Task
//
//  Created by Mohamed Elkazzaz on 26/12/2023.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {

    @IBOutlet weak var marvelImageView: UIImageView!
    @IBOutlet weak var marvelNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var comicsCollectionView: UICollectionView!
    @IBOutlet weak var seriesCollectionView: UICollectionView!
    @IBOutlet weak var storiesCollectionView: UICollectionView!
    @IBOutlet weak var eventsCollectionView: UICollectionView!
    
    var id = 0
    var details: Character?
    override func viewDidLoad() {
        super.viewDidLoad()

    
        
        updateUI()
        
        comicsCollectionView.delegate = self
        comicsCollectionView.dataSource = self
        seriesCollectionView.delegate = self
        seriesCollectionView.dataSource = self
        storiesCollectionView.delegate = self
        storiesCollectionView.dataSource = self
        eventsCollectionView.delegate = self
        eventsCollectionView.dataSource = self
        comicsCollectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "categoryCell")
        seriesCollectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "categoryCell")
        storiesCollectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "categoryCell")
        eventsCollectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "categoryCell")
    }
    
    func updateUI(){
        marvelNameLabel.text = details?.name
        descriptionLabel.text = details?.description
    }
    
}

extension DetailsViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == comicsCollectionView {
            return details?.comics?.items?.count ?? 0
        }else if collectionView == seriesCollectionView {
            return details?.series?.items?.count ?? 0
        }else if collectionView == storiesCollectionView {
            return details?.stories?.items?.count ?? 0
        }else {
            return details?.events?.items?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == comicsCollectionView {
            let cell = comicsCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCell
            cell.nameLabel.text = details?.comics?.items?[indexPath.row].name
            cell.categoryImageView.sd_setImage(with: URL(string: details?.comics?.items?[indexPath.row].resourceURI ?? ""), placeholderImage: UIImage(named: "marvel-logo-2D20B064BD-seeklogo.com"))
            return cell
        }else if collectionView == seriesCollectionView {
            let cell = seriesCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as!  CategoryCell
            cell.categoryImageView.sd_setImage(with: URL(string: details?.series?.items?[indexPath.row].resourceURI ?? ""), placeholderImage: UIImage(named: "marvel-logo-2D20B064BD-seeklogo.com"))
            cell.nameLabel.text = details?.series?.items?[indexPath.row].name
            return cell
        }else if collectionView == storiesCollectionView {
            let cell = storiesCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCell
            cell.categoryImageView.sd_setImage(with: URL(string: details?.stories?.items?[indexPath.row].resourceURI ?? ""), placeholderImage: UIImage(named: "marvel-logo-2D20B064BD-seeklogo.com"))
            cell.nameLabel.text = details?.stories?.items?[indexPath.row].name
            return cell
        }else {
            let cell = eventsCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCell
            cell.categoryImageView.sd_setImage(with: URL(string: details?.events?.items?[indexPath.row].resourceURI ?? ""), placeholderImage: UIImage(named: "marvel-logo-2D20B064BD-seeklogo.com"))
            cell.nameLabel.text = details?.events?.items?[indexPath.row].name
            return cell
        }
    }
    
    
    
    
}
