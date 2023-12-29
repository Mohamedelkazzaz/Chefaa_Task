//
//  CategoryCell.swift
//  Chefaa_Task
//
//  Created by Mohamed Elkazzaz on 26/12/2023.
//

import UIKit
import SDWebImage
import Alamofire

class CategoryCell: UICollectionViewCell {

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    private var request: DataRequest?
    func configureCell(item: BaseItem?){
        nameLabel.text = item?.name
        request = NetworkManager().fetchResource(uriResource: item?.resourceURI ?? "") { [weak self] items, error in
            if let item = items?.first {
                self?.categoryImageView.sd_setImage(with: URL(string: item.thumbnail?.urlPhoto ?? ""), placeholderImage: UIImage(named: "marvel-logo-2D20B064BD-seeklogo.com"))
            }
            if let error = error{
                self?.categoryImageView.image = UIImage(named: "marvel-logo-2D20B064BD-seeklogo.com")
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.categoryImageView.image = UIImage(named: "")
        request?.cancel()
    }
    
}
