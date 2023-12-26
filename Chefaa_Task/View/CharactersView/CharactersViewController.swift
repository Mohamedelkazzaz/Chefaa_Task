//
//  CharactersViewController.swift
//  Chefaa_Task
//
//  Created by Mohamed Elkazzaz on 25/12/2023.
//

import UIKit

class CharactersViewController: UIViewController {

    @IBOutlet weak var marvelTableView: UITableView!
    @IBOutlet weak var searchButton: UIButton!
    
    var viewModel: CharactersViewModel! = CharactersViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        searchButton.setTitle("", for: .normal)
        marvelTableView.delegate = self
        marvelTableView.dataSource = self
        
        marvelTableView.register(UINib(nibName: "CharacterCell", bundle: nil), forCellReuseIdentifier: "marvelCell")
        
        viewModel.viewIsloaded()
        viewModel.bindingData = { character, error in
            DispatchQueue.main.async {
                self.marvelTableView.reloadData()
            }
        
        if let error = error{
            print(error.localizedDescription)
        }
    }
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        
    }

}

extension CharactersViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
        return viewModel.getCharacters()?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = marvelTableView.dequeueReusableCell(withIdentifier: "marvelCell", for: indexPath) as!
        CharacterCell
        
        cell.setup(character: viewModel.getCharacter(indexPath: indexPath))
        cell.selectionStyle = .none
        if viewModel.getCharacters()?.count ?? 0 == indexPath.row + 1 {
            viewModel.checkIfNeedToFetchNewPage()
        }
        return cell
        
    }
}
