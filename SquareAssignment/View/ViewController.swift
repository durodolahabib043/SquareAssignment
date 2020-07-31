//
//  ViewController.swift
//  SquareAssignment
//
//  Created by Habib Durodola on 2020-07-28.
//  Copyright © 2020 DOH. All rights reserved.
//

import UIKit


class ViewController: UIViewController  {

    @IBOutlet weak var tablewView: UITableView!
    @IBOutlet weak var employeeTypePicker: UIPickerView!

    // Variables
    let tableheight:CGFloat = 300
    private var employee: [EmployeeElement] = []
    var errorCheck:String?
    let cellIdentifier = "cellIdentifier"
    let cellUIB = "EmployeeTableCell"
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupEmployeePicker()
        loadEmployeeApi(input: "employees.json")
    }
    
    func setupTableView(){ ///set up tableview
        tablewView.delegate = self
        tablewView.dataSource = self
        tablewView.register(UINib(nibName: cellUIB, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }

    func setupEmployeePicker(){ /// set up picker
        employeeTypePicker.delegate = self
        employeeTypePicker.dataSource = self
        pickerData = [Constants.EMPLOYEES_JSON , Constants.EMPLOYEES_MALFORMED_JSON, Constants.EMPLOYEES_EMPTY_JSON]
    }
    
    func loadEmployeeApi(input : String)  { /// call employee api
        ApiManager().fetchFilms(inputJson: input) {
            employee,err  in
            self.employee = employee
            if !err.isEmpty {
                self.errorCheck = err
            }
            DispatchQueue.main.async {
                self.tablewView.reloadData()
            }

        }
    }
    
}

extension ViewController :  UITableViewDelegate , UITableViewDataSource , UIPickerViewDelegate, UIPickerViewDataSource{

    // MARK: - pickerView delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerData.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        pickerData[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(pickerData[row])

        loadEmployeeApi(input: pickerData[row])
    }



    // MARK: - tableview delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if (self.errorCheck == "error") {
            tableView.setEmptyView(title: "Oopps", message: "Malformed json \(self.errorCheck!)")
            self.errorCheck = nil
        }
        else {
            tableView.setEmptyView(title: "Oopps", message: "No employee contact information available")
        }

        return self.employee.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! EmployeeTableCell

        let employeeIndex = self.employee[indexPath.row]

        let  model = EmployeeModelView(name: employeeIndex.fullName, emailAddress: employeeIndex.emailAddress, phone: employeeIndex.phoneNumber, team: employeeIndex.team, bio: employeeIndex.biography ,photo: employeeIndex.photoURLLarge)
        cell.displayName(model: model)
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableheight
    }
}

