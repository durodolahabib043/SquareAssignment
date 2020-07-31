//
//  ApiManager.swift
//  SquareAssignment
//
//  Created by Habib Durodola on 2020-07-28.
//  Copyright © 2020 DOH. All rights reserved.
//

import Foundation

class ApiManager {
    var errorMessage = ""
    //typealias employeeResult = ([EmployeeElement]? , _ error: String)) -> Void

    func fetchFilms(inputJson:String , completionHandler: @escaping ([EmployeeElement] , _ error: String) -> Void) {
        let url = URL(string: Constants.BASE_URL + inputJson)!
        var employeeElement: [EmployeeElement] = []
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                self.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
                print("Error with fetching films: \(error)")
            } else if
                let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200{
                do {
                    let allEmployee = try JSONDecoder().decode(Employee.self, from: data)
                    employeeElement = allEmployee.employees

                 } catch {
                       self.errorMessage = "error"
                 }
            }
            else if
                let response = response as? HTTPURLResponse,
                (400...500).contains(response.statusCode) {
                employeeElement = [];

            }
            completionHandler(employeeElement , self.errorMessage)
        })
        task.resume()
    }
}
