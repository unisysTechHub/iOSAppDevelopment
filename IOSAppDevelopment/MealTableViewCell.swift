//
//  MealTableViewCell.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 10/09/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var RatingControl: RatingControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
