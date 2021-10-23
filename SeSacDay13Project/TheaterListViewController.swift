//
//  TheaterListViewController.swift
//  SeSacDay13Project
//
//  Created by 경원이 on 2021/10/24.
//

import UIKit

class TheaterListViewController: UIViewController {

    @IBOutlet var tableViewHeader: UIView!
    @IBOutlet var theaterTableView: UITableView!
    @IBOutlet var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        theaterTableView.dataSource = self
        theaterTableView.delegate = self
       
    }
    


    @IBAction func closeButtonClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

extension TheaterListViewController: UITableViewDelegate {
    

}

extension TheaterListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(withIdentifier: "TheaterCell", for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    
}
