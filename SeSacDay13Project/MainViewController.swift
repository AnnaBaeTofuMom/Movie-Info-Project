//
//  MainViewController.swift
//  SeSacDay13Project
//
//  Created by 경원이 on 2021/10/19.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet var mainTableView: UITableView!
    

    @IBOutlet weak var threeButtonView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        threeButtonView.layer.cornerRadius = 10
        threeButtonView.layer.shadowOpacity = 0.1
        threeButtonView.layer.shadowOffset = CGSize.init(width: 5, height: 5)
        
        mainTableView.dataSource = self
        mainTableView.delegate = self
    }
    
    @IBAction func searchButtonClicked(_ sender: UIButton) {
        let uvc = self.storyboard!.instantiateViewController(withIdentifier: "searchVC")
        
        
        uvc.modalPresentationStyle = .fullScreen
        
        self.present(uvc, animated: true)
        
    }
    

    
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "APageCell") else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 340
    }
    
    }
    
   

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cv = self.storyboard!.instantiateViewController(withIdentifier: "CastViewController")
        
        cv.modalPresentationStyle = .automatic
        
        self.navigationController?.pushViewController(cv, animated: true)
    }
    
}
