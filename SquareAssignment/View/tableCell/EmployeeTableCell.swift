//
//  EmployeeTableCell.swift
//  SquareAssignment
//
//  Created by Habib Durodola on 2020-07-28.
//  Copyright © 2020 DOH. All rights reserved.
//

import UIKit

class EmployeeTableCell: UITableViewCell {
    
    @IBOutlet weak var employeeName: UILabel!
    
    @IBOutlet weak var employeeEmailAddress: UILabel!
    @IBOutlet weak var employeePhoneNumber: UILabel!
    @IBOutlet weak var employeeTeam: UILabel!
    @IBOutlet weak var employeeBio: UILabel!
    @IBOutlet weak var employeeImageView: UIImageView!
    @IBOutlet weak var employeeType: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func displayName(model : EmployeeModelView) {
        employeeName.text = "Name :\(model.name)"
        employeeEmailAddress.text = "Email Address :\(model.emailAddress)"
        employeeTeam.text = "Teams: \(model.team)"
        guard let bio = model.bio ,
            let phone = model.phone else {
                return
        }
        employeeType.text = "Bio: \(bio)"
        employeePhoneNumber.text = "Phone Number : \(phone)"
    }
    
}
