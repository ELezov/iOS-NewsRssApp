//
//  NewsTableViewCell.swift
//  RssNewsClient
//
//  Created by Nikolay on 04.10.17.
//  Copyright © 2017 Eugene Lezov. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        @IBOutlet weak var timeLabel: UILabel!
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
