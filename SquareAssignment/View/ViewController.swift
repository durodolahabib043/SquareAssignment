//
//  ViewController.swift
//  SquareAssignment
//
//  Created by Habib Durodola on 2020-07-28.
//  Copyright © 2020 DOH. All rights reserved.
//

import UIKit


class ViewController: UIViewController  {
    private var employee: [EmployeeElement] = []
    
    @IBOutlet weak var tablewView: UITableView!
    //indentifer
    let cellIdentifier = "cellIdentifier"
    let cellUIB = "EmployeeTableCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        loadEmployeeApi()
    }
    
    func setupTableView(){
        tablewView.delegate = self
        tablewView.dataSource = self
        tablewView.register(UINib(nibName: cellUIB, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
    }
    
    func loadEmployeeApi()  {
        ApiManager().fetchFilms { employee in
            self.employee = employee ;
            DispatchQueue.main.async {
                self.tablewView.reloadData()
            }
        }
        
    }
    
}

extension ViewController :  UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.employee.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! EmployeeTableCell
        
        let employeeIndex = self.employee[indexPath.row]
        
        let model = EmployeeModelView(name: employeeIndex.fullName, emailAddress: employeeIndex.emailAddress, phone: employeeIndex.phoneNumber, team: employeeIndex.team, bio: employeeIndex.biography ,photo: employeeIndex.photoURLLarge)
        
        cell.displayName(model: model)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
}

