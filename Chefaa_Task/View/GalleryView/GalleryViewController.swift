//
//  GalleryViewController.swift
//  Chefaa_Task
//
//  Created by Mohamed Elkazzaz on 28/12/2023.
//

import UIKit

class GalleryViewController: UIViewController {

    @IBOutlet weak var galleryCollectionView: UICollectionView!
    var gallery: [BaseItem]?
    var selsectedIndex: IndexPath?
    override func viewDidLoad() {
        super.viewDidLoad()

        
        galleryCollectionView.delegate = self
        galleryCollectionView.dataSource = self
        
//        galleryCollectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "categoryCell")
        
        galleryCollectionView.selectItem(at: selsectedIndex, animated: true, scrollPosition: .left)
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}

extension GalleryViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gallery?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = galleryCollectionView.dequeueReusableCell(withReuseIdentifier: "galleryCell", for: indexPath) as! GalleryCell
        cell.galleryCell(item: gallery?[indexPath.row])
        return cell
    }
    
    
}
