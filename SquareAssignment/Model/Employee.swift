//
//  Employee.swift
//  SquareAssignment
//
//  Created by Habib Durodola on 2020-07-28.
//  Copyright © 2020 DOH. All rights reserved.
//

import Foundation

// MARK: - Employee
struct Employee: Codable {
    let employees: [EmployeeElement]
}

// MARK: - EmployeeElement
struct EmployeeElement: Codable {
    let uuid, fullName, emailAddress: String
    let phoneNumber , biography : String?
    let photoURLSmall, photoURLLarge: String?
    let team: String
    let employeeType: EmployeeType

    enum CodingKeys: String, CodingKey {
        case uuid
        case fullName = "full_name"
        case phoneNumber = "phone_number"
        case emailAddress = "email_address"
        case biography
        case photoURLSmall = "photo_url_small"
        case photoURLLarge = "photo_url_large"
        case team
        case employeeType = "employee_type"
    }
}

enum EmployeeType: String, Codable {
    case contractor = "CONTRACTOR"
    case fullTime = "FULL_TIME"
    case partTime = "PART_TIME"
}

