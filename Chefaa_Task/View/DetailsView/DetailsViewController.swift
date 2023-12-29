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
    


    var viewModel: DetailsViewModel! = DetailsViewModel()
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
        marvelImageView.sd_setImage(with: URL(string: viewModel.character?.thumbnail?.urlPhoto ?? ""), placeholderImage: UIImage(named: "marvel-logo-2D20B064BD-seeklogo.com"))
        marvelNameLabel.text = viewModel.character?.name
        if viewModel.character?.description == ""{
            descriptionLabel.text = "N/A"
        }else{
            descriptionLabel.text = viewModel.character?.description
        }
    }
    
}

extension DetailsViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == comicsCollectionView {
            return viewModel.getCharacters()?.comics?.items?.count ?? 0
        }else if collectionView == seriesCollectionView {
            return viewModel.getCharacters()?.series?.items?.count ?? 0
        }else if collectionView == storiesCollectionView {
            return viewModel.getCharacters()?.stories?.items?.count ?? 0
        }else {
            return viewModel.getCharacters()?.events?.items?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == comicsCollectionView {
            let cell = comicsCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCell
            cell.configureCell(item: viewModel.getCharacter(indexPath: indexPath)?.comics?.items?[indexPath.row])
            return cell
        }else if collectionView == seriesCollectionView {
            let cell = seriesCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as!  CategoryCell
            cell.configureCell(item: viewModel.getCharacter(indexPath: indexPath)?.series?.items?[indexPath.row])
            return cell
        }else if collectionView == storiesCollectionView {
            let cell = storiesCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCell
            cell.configureCell(item: viewModel.getCharacter(indexPath: indexPath)?.stories?.items?[indexPath.row])
            return cell
        }else {
            let cell = eventsCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCell
            cell.configureCell(item: viewModel.getCharacter(indexPath: indexPath)?.events?.items?[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let stoaryBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = stoaryBoard.instantiateViewController(withIdentifier: "GalleryViewController") as! GalleryViewController
        vc.modalPresentationStyle = .fullScreen
       
        if collectionView == comicsCollectionView{
            
            vc.gallery = viewModel.character?.comics?.items
            
        }else if collectionView == seriesCollectionView{
            vc.gallery = viewModel.character?.series?.items
        }else if collectionView == storiesCollectionView{
            vc.gallery = viewModel.character?.stories?.items
        }else{
            vc.gallery = viewModel.character?.events?.items
        }
        
        vc.selsectedIndex = indexPath
        self.present(vc, animated: true)
    }
    
    
    
}
