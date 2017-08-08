//
//  cellTableViewCell.swift
//  othmanTask
//
//  Created by Mohammad Othman on 8/7/17.
//  Copyright © 2017 Mohammad Othman. All rights reserved.
//

import UIKit

class cellTableViewCell: UITableViewCell {
    @IBOutlet weak var typeA: UILabel!

    @IBOutlet weak var statusImageView: UIButton!
    @IBOutlet weak var type2: UILabel!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
