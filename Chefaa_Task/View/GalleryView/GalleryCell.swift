//
//  GalleryCell.swift
//  Chefaa_Task
//
//  Created by Mohamed Elkazzaz on 28/12/2023.
//

import UIKit
import Alamofire

class GalleryCell: UICollectionViewCell {
    
    @IBOutlet weak var marvelImageView: UIImageView!
    
    @IBOutlet weak var marvelNameLabel: UILabel!
    
    private var request: DataRequest?
    
    func galleryCell(item: BaseItem?){
        marvelNameLabel.text = item?.name
        request = NetworkManager().fetchResource(uriResource: item?.resourceURI ?? "") { [weak self] items, error in
            if let item = items?.first {
                self?.marvelImageView.sd_setImage(with: URL(string: item.thumbnail?.urlPhoto ?? ""), placeholderImage: UIImage(named: "marvel-logo-2D20B064BD-seeklogo.com"))
            }
            if let error = error{
                self?.marvelImageView.image = UIImage(named: "marvel-logo-2D20B064BD-seeklogo.com")
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.marvelImageView.image = UIImage(named: "")
        request?.cancel()
    }
}
