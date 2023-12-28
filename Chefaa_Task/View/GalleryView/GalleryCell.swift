//
//  GalleryCell.swift
//  Chefaa_Task
//
//  Created by Mohamed Elkazzaz on 28/12/2023.
//

import UIKit

class GalleryCell: UICollectionViewCell {
    
    @IBOutlet weak var marvelImageView: UIImageView!
    
    @IBOutlet weak var marvelNameLabel: UILabel!
    
    func galleryCell(item: BaseItem?){
        marvelNameLabel.text = item?.name
        NetworkManager().fetchResource(uriResource: item?.resourceURI ?? "") { [weak self] items, error in
            if let item = items?.first {
                self?.marvelImageView.sd_setImage(with: URL(string: item.thumbnail?.urlPhoto ?? ""), placeholderImage: UIImage(named: "marvel-logo-2D20B064BD-seeklogo.com"))
            }
            if let error = error{
                self?.marvelImageView.image = UIImage(named: "marvel-logo-2D20B064BD-seeklogo.com")
            }
        }
    }
}
