# SquareAssignment

## Assumption
1. That Internet is always present

## App Architecture
This app uses the MVVM architecture
1. The View - consist of the viewController, employeeTableCell and customImageView
2. ModelView - consist of the EmployeeModelView
3. Model - consist of employee class

Also there are helper and ApiManager class. These are used for dependency injections 
The MVVM is main to de-couple classes for test.

## App Demo
This app has a picker and a tableview. Picker is used to switch between the 3 different apis, 
the tableview inturn respond to it 

## Unit Test
The app has a unit test section where the 3 api responses are been tested 
