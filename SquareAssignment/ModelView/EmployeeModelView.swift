//
//  EmployeeModelView.swift
//  SquareAssignment
//
//  Created by Habib Durodola on 2020-07-28.
//  Copyright © 2020 DOH. All rights reserved.
//

import Foundation

class EmployeeModelView {

    let name , emailAddress ,  team : String
    let bio , phone: String?

    init(name : String , emailAddress: String , phone : String? , team : String , bio : String? ) {
        self.name = name
        self.emailAddress = emailAddress
        self.phone = phone
        self.team = team
        self.bio = bio
    }

}
