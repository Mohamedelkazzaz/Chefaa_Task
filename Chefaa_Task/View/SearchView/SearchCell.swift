//
//  SearchCell.swift
//  Chefaa_Task
//
//  Created by Mohamed Elkazzaz on 28/12/2023.
//

import UIKit

class SearchCell: UITableViewCell {

    @IBOutlet weak var marvelImageView: UIImageView!
    
    @IBOutlet weak var marvelNameLabel: UILabel!
    
    
    func setup(character: Character?){
        marvelNameLabel.text = character?.name
        marvelImageView.sd_setImage(with: URL(string: character?.thumbnail?.urlPhoto ?? ""), placeholderImage: UIImage(named: "marvel-logo-2D20B064BD-seeklogo.com"))
    }
}
