//
//  EmplistCell.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 19/09/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import UIKit
import CoreData

class EmplistCell: UITableViewCell {
    @IBOutlet var id     : UILabel!
    @IBOutlet var name : UILabel!
    @IBOutlet var address : UILabel!
    @IBOutlet var photo    : UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(employeeModel : EmployeeModel)
    {
        self.id.text = String( employeeModel.id)
        self.name.text = employeeModel.name
        self.address.text = employeeModel.address
       // self.photo.image = UIImage(named: "filledStar")
    }
    func configure(mangedOject : Employee )
    {
        self.name.text = mangedOject.name
        self.id.text =   String(mangedOject.id)
        self.address.text = mangedOject.address
        
        
    }
    
}
