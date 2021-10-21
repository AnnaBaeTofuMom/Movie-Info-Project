//
//  SearchViewController.swift
//  SeSacDay13Project
//
//  Created by 경원이 on 2021/10/21.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet var searchTableView: UITableView!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        searchBar.backgroundColor = .black
        searchBar.barTintColor = .black
        searchBar.searchTextField.textColor = .white
        searchBar.layer.cornerRadius = 10
        closeButton.tintColor = .white
        view.backgroundColor = .black
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        
        
        
    }
    
    @IBAction func closeButtonClicked(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableCell") else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}


extension SearchViewController: UITableViewDelegate {
    
}


    
    

