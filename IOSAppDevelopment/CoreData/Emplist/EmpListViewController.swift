//
//  EmpListViewController.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 19/09/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import UIKit
import CoreData
class EmpListViewController: UITableViewController, NSFetchedResultsControllerDelegate,EmplListheadrFooterViewDeleagate {
    var employees  = [EmployeeModel]()
    var fetchResultController : NSFetchedResultsController<NSFetchRequestResult>?
    var expandSection : [Int : Bool] = Dictionary()
     
 @IBAction func addEmployee()
 {
    do{
   let lastEmpId = try getLastEmployeeId()
        print(lastEmpId)
        insertEmployeeTable(newEmployeeId: lastEmpId + 1)
    } catch
    {
        fatalError("error in getting last emplyee id")
    }
 }
    override func viewDidLoad() {
        super.viewDidLoad()
        deleteAllRows()
        loadEmlopyeeTable()
       // fethEmpoyeeData()
        self.tableView.register(EmplistHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "headerView")
        
        let request =     NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        
        request.sortDescriptors = [NSSortDescriptor(key: "projectName", ascending: true),NSSortDescriptor(key: "id", ascending: true)]
        request.returnsObjectsAsFaults = false
    
        fetchResultController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: appMainStoreContext(), sectionNameKeyPath: #keyPath(Employee.projectName), cacheName: nil)
        fetchResultController?.delegate = self
        do{
         try fetchResultController?.performFetch()
        }
        catch {
            print("fethcEroor")
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
          return fetchResultController?.sections?.count ?? 1
        
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let expandSection = expandSection[section]
        else
        {
            self.expandSection[section] = true
         //   return fetchResultController?.fetchedObjects?.count ?? 0
            return  fetchResultController?.sections![section].numberOfObjects ?? 0
        }
        if !expandSection
        {
            return 0
        }
                
       return fetchResultController?.sections![section].numberOfObjects ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndentier = "emplistCell"
        guard let emplistCell = tableView.dequeueReusableCell(withIdentifier: cellIndentier, for: indexPath) as? EmplistCell
        else
        {
            fatalError("tableview cell not found with the identifier")
            
        }
       // emplistCell.configure(employeeModel: employees[indexPath.row])
//        emplistCell.configure(mangedOject: (fetchResultController?.fetchedObjects?[indexPath.row]) as! Employee)
        emplistCell.configure(mangedOject: (fetchResultController?.sections![indexPath.section].objects?[indexPath.row]) as! Employee)
        return emplistCell
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        30
    }
    
   override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerView") as? EmplistHeaderFooterView else {
        fatalError("instance not found with the identifier headerView")
    }
      
    guard  let expandORCollapseIcon = headerView.contentView.subviews[1] as? UIButton
         else
    {
        fatalError("expand/collapse icon istance not exists")
    }
    
    guard  let sectionLabel = headerView.contentView.subviews[0] as? UILabel
         else
    {
        fatalError("expand/collapse icon istance not exists")
    }
    expandORCollapseIcon.tag = section
    sectionLabel.text = fetchResultController?.sections?[section].name
        return headerView
    }
    
    func onExpandORCollapseTouch(icon: UIButton) {

        let section = icon.tag
        let collapseIcon = UIImage(named: "collapseIcon")
        let expandIcon = UIImage(named: "expandIcon")
        func indexPathsForSection() -> [IndexPath] {
               var indexPaths = [IndexPath]()
            let noOfFetechedObjects = self.fetchResultController?.sections?[section].numberOfObjects ?? 0
               for row in 0..<noOfFetechedObjects {
                    indexPaths.append(IndexPath(row: row,
                                                section: section))
                }
                
                return indexPaths
            }
        
        if expandSection[section]!
        {
            expandSection[section] = false
            icon.setImage(expandIcon, for: .normal)
            self.tableView.deleteRows(at: indexPathsForSection(),
                                      with: .fade)
        }
        else{
            expandSection[section] = true
            icon.setImage(collapseIcon, for: .normal)
            self.tableView.insertRows(at: indexPathsForSection(),
                                      with: .fade)

        }
        
        
    }
    
    
    func insertEmployeeTable(newEmployeeId : Int16)
    {
        let empManageObject = EmpEnitityManagedObject()
        
        empManageObject.setValue("Ramesh" , forKey: "name")
        empManageObject.setValue(newEmployeeId, forKey: "id")
        empManageObject.setValue("someAddress", forKey: "address")
        empManageObject.setValue("Project 1", forKey: "projectName")

        
        do {
            try appMainStoreContext().save()
        } catch let error as NSError {
            print("context save error \(error.userInfo)")
        }
    }
   
    func getLastEmployeeId() throws -> Int16
    {
        let fetchRequest =  NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        let sortDescripton = NSSortDescriptor(key: "id", ascending: false)
        fetchRequest.sortDescriptors = [sortDescripton]
        fetchRequest.returnsObjectsAsFaults = false
        fetchRequest.fetchLimit = 1
        do{
         let resultData = try appMainStoreContext().fetch(fetchRequest)
            guard let employees =  resultData as? [Employee] , employees.count > 0
            else
           {
            return 1000
           }
            
            return employees[0].id
        } catch
        {
            throw NSException() as! Error
        }
        
        
    }
   func  loadEmlopyeeTable()
    {
    for i in 1...5
    {
        
        let empManageObject = EmpEnitityManagedObject()
        empManageObject.setValue("Ramesh" , forKey: "name")
        empManageObject.setValue(1000+i, forKey: "id")
        empManageObject.setValue("someAddress", forKey: "address")
        if i%2 == 0
        {
            empManageObject.setValue("Project 1", forKey: "projectName")
        }
        else
        {
            empManageObject.setValue("Project 2", forKey: "projectName")

        }
    }
    
    do {
        try appMainStoreContext().save()
    } catch let error as NSError {
        print("context save error \(error.userInfo)")
    }
    
    }
    
    func deleteAllRows()
    {
        let request =     NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        do {
            try (UIApplication.shared.delegate as! AppDelegate).persistentContainer.persistentStoreCoordinator.execute(deleteRequest, with: appMainStoreContext())
        } catch let error as NSError {
            // TODO: handle the error
            print("context save error \(error.userInfo)")

        }
    }
    func fethEmpoyeeData()
    {
        let request =     NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        request.returnsObjectsAsFaults = false
    
        
        do {
            let result = try appMainStoreContext().fetch(request)
            print(result.count)
            for data in result as! [Employee] {
               let employeeModel = EmployeeModel(id: data.value(forKey: "id") as! Int, name: data.value(forKey: "name") as! String, address: data.value(forKey: "address") as! String)
                employees.append(employeeModel)
               print(data.value(forKey: "id") as! Int)
                print(data.value(forKey: "address") as! String)

            }
            
        } catch {
            print("Failed")
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    
        self.tableView.reloadData()
//        let itemCount =  controller.fetchedObjects?.count ?? 1 - 1
//        let scorllToItem = itemCount - 1
//        let indexPath = NSIndexPath(item: scorllToItem , section: 0)
//        self.tableView.scrollToRow(at: indexPath as IndexPath, at: UITableView.ScrollPosition.bottom, animated: true)
    }
}

