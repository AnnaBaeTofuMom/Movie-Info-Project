//
//  SearchTableViewCell.swift
//  SeSacDay13Project
//
//  Created by 경원이 on 2021/10/21.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    static let identifier = "SearchTableViewCell"

    @IBOutlet var cellOverviewTextView: UITextView!
    @IBOutlet var cellImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        cellOverviewTextView.allowsEditingTextAttributes = false
        cellOverviewTextView.isScrollEnabled = false
        cellOverviewTextView.isEditable = false
        titleLabel.textColor = .white
        cellOverviewTextView.textColor = .white
        cellOverviewTextView.backgroundColor = .black
        self.backgroundColor = .black
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
