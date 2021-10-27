//
//  SearchViewController.swift
//  SeSacDay13Project
//
//  Created by 경원이 on 2021/10/21.
//

import UIKit
import Alamofire
import SwiftyJSON


class SearchViewController: UIViewController, UITableViewDataSourcePrefetching {
    
    /*셀이 화면에 보이기 전에 필요한 리소스를 미리 다운받는 기능
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            if movieData.count - 1 == indexPath.row {
                startPage += 10
                fetchMovieData()
            }
        }
    } */
    
    //취소
    
    var movieData: [String] = []
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        print("cancel")
    }
    
    
    var startPage = 1
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet var searchTableView: UITableView!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchMovieData()
        
        
        
        searchBar.backgroundColor = .black
        searchBar.barTintColor = .black
        searchBar.searchTextField.textColor = .white
        searchBar.layer.cornerRadius = 10
        closeButton.tintColor = .white
        view.backgroundColor = .black
        
        searchTableView.delegate = self
        searchTableView.prefetchDataSource = self
        searchTableView.dataSource = self
        
        
        
    }
    
    func fetchMovieData() {
        
        if let query = "스파이더맨".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            let url = "https://dapi.kakao.com/v2/search/web?query=\(query)&display=10&start=1"
            
            let header: HTTPHeaders = [
                "Authorization": "KakaoAK 3e39c69ae301b2973b54b9bc58253084",
                "Content-Type": "application/x-www-form-urlencoded"
            ]
        
            
        AF.request(url, method: .get, headers: header).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                for item in json["documents"].arrayValue {
                    
                    
                    let value = item["title"].stringValue
                    self.movieData.append(value)
                    print(value)
                    
                }
                
                self.searchTableView.reloadData()
                
                print(self.movieData)
                
            case .failure(let error):
                print(error)
                }
            }
            
        }
        
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
        return movieData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableCell", for: indexPath) as! SearchTableViewCell
    
        cell.lbl1.text = movieData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}


extension SearchViewController: UITableViewDelegate {
    
}

class SearchTableViewCell: UITableViewCell {
    
    @IBOutlet var img: UIImageView!
    @IBOutlet var lbl1: UILabel!
    @IBOutlet var lbl2: UILabel!
    @IBOutlet var lbl3: UILabel!
    
    
}
    
    

