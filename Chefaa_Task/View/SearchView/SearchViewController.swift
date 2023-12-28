//
//  SearchViewController.swift
//  Chefaa_Task
//
//  Created by Mohamed Elkazzaz on 28/12/2023.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var searchTableView: UITableView!
    
    var viewModel: SearchViewModel! = SearchViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        searchTableView.delegate = self
        searchTableView.dataSource = self
        
        searchBar.delegate = self
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        viewModel.viewIsloaded()
        viewModel.bindingData = { character, error in
            DispatchQueue.main.async {
                self.searchTableView.reloadData()
            }
        
        if let error = error{
            print(error.localizedDescription)
        }
    }
    }
  
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getCharacters()?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchCell
        
        cell.setup(character: viewModel.getCharacter(indexPath: indexPath))
        cell.selectionStyle = .none
        if viewModel.getCharacters()?.count ?? 0 == indexPath.row + 1 {
            viewModel.checkIfNeedToFetchNewPage()
        }
        return cell
    }
    
    
}

extension SearchViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

                    viewModel.search(with: searchText)
        
    }
}

