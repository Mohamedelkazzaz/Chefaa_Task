//
//  CharacterCell.swift
//  Chefaa_Task
//
//  Created by Mohamed Elkazzaz on 25/12/2023.
//

import UIKit
import SDWebImage

class CharacterCell: UITableViewCell {

  
    @IBOutlet weak var marvelImageView: UIImageView!
    @IBOutlet weak var marvelNameLabel: UILabel!
    
    
    func setup(character: CharacterDataContainer?){
        marvelNameLabel.text = character?.results.first?.name
        marvelImageView.sd_setImage(with: URL(string: character?.results.first?.thumbnail.path ?? ""), placeholderImage: UIImage(named: "placeholder.png"))

    }
}
