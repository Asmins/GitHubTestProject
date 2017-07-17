//
//  IssuesTableViewCell.swift
//  GitHubTestProject
//
//  Created by Asmins on 17.07.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import UIKit

class IssuesTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var countComments: UILabel!
    @IBOutlet weak var statusLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func settingCell(_ issues: Issues) {
        self.title.text = issues.title
        self.authorLabel.text = issues.author
        self.countComments.text = "\(issues.comments)"
        self.statusLabel.text = issues.state

        if issues.state == "open" {
            self.statusLabel.textColor = UIColor.black
        } else {
            self.statusLabel.textColor = UIColor.red
        }

    }

}
