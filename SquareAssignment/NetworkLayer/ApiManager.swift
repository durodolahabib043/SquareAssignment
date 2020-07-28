//
//  ApiManager.swift
//  SquareAssignment
//
//  Created by Habib Durodola on 2020-07-28.
//  Copyright © 2020 DOH. All rights reserved.
//

import Foundation

 class ApiManager {

var films: [Employee] = []
private let domainUrlString = "https://s3.amazonaws.com/sq-mobile-interview/"

func fetchFilms(completionHandler: @escaping ([EmployeeElement]) -> Void) {
  let url = URL(string: domainUrlString + "employees.json")!

  let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
    if let error = error {
      print("Error with fetching films: \(error)")
      return
    }

    guard let httpResponse = response as? HTTPURLResponse,
          (200...299).contains(httpResponse.statusCode) else {
            print("Error from Api manager")
      return
    }

    if let data = data,
      let allEmployee = try? JSONDecoder().decode(Employee.self, from: data) {
        completionHandler(allEmployee.employees )

    }
  })
  task.resume()
}
}
