//
//  ViewController.swift
//  SquareAssignment
//
//  Created by Habib Durodola on 2020-07-28.
//  Copyright © 2020 DOH. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
      private var employee: [EmployeeElement]?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ApiManager().fetchFilms { employee in
            print("this is successdully \(employee[0].fullName)")
        }
    }


}

