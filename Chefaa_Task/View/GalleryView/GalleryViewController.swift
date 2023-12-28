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
        
        galleryCollectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "categoryCell")
        
        galleryCollectionView.selectItem(at: selsectedIndex, animated: true, scrollPosition: .left)
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}

extension GalleryViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gallery?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = galleryCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCell
        cell.configureCell(item: gallery?[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            //For entire screen size
            let screenSize = UIScreen.main.bounds.size
            return screenSize
            //If you want to fit the size with the size of ViewController use bellow
            let viewControllerSize = self.view.frame.size
            return viewControllerSize

            // Even you can set the cell to uicollectionview size
            let cvRect = collectionView.frame
            return CGSize(width: cvRect.width, height: cvRect.height)


        }
}
