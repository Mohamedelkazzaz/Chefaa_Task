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
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        let stoaryBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = stoaryBoard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stoaryBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = stoaryBoard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.viewModel.character = viewModel.getCharacter(indexPath: indexPath)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
