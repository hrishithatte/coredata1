//
//  ViewController.swift
//  coredata1
//
//  Created by Student-001 on 13/12/18.
//  Copyright © 2018 ra. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var empinfo = [String]()
    var empinfo1 = [String]()
    var empinfo2 = [String]()
    var empinfo3 = [String]()
    var empinfo4 = [Double]()
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var txtfldname: UITextField!
    
    @IBOutlet weak var txtfldemployeeNo: UITextField!
    
    @IBOutlet weak var txtflddepartNo: UITextField!
    
    @IBOutlet weak var txtflcontactNo: UITextField!
    
    @IBOutlet weak var txtfldsalary: UITextField!
    
    @IBAction func btupdate(_ sender: UIButton) {
        
        let context = delegate.persistentContainer.viewContext;
        
        let empObjext: NSObject=NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context)
        empObjext.setValue(self.txtfldemployeeNo.text, forKey: "employeeNo")
         empObjext.setValue(self.txtfldname.text, forKey: "name")
         empObjext.setValue(self.txtflcontactNo.text, forKey: "contactNo")
         empObjext.setValue(self.txtflddepartNo.text, forKey: "departmentNo")
        let formater = NumberFormatter()
        let sal = formater.number(from: self.txtfldsalary.text!)as! Double
        empObjext.setValue(sal, forKey: "salary")
        do
        {
            try context.save()
        }
        catch
        {
            print("Error")
        }
        print("Insert:Success")
    }
    
    @IBAction func btdelete(_ sender: UIButton) {
        
        let context = delegate.persistentContainer.viewContext;
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        request.predicate = NSPredicate(format: "name = %@", self.txtfldname.text!)
        
        request.returnsObjectsAsFaults = false
        do
        {
            let result = try context.fetch(request)
            if(result.count == 1)
            {
                let myObject : NSManagedObject = result.first! as! NSManagedObject
                context.delete(myObject)
                do
                {
                    try context.save()
                }
                catch
                {
                    print(error.localizedDescription)
                }
                print("deleted succefully")
            }
        }
        catch{
            print("delete: Success")
        }
    }
    
    
    @IBAction func btupdate1(_ sender: UIButton) {
        let context = delegate.persistentContainer.viewContext;
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        request.predicate = NSPredicate(format: "name = %@", self.txtfldname.text!)
        
        request.returnsObjectsAsFaults = false
        do
        {
            let result = try context.fetch(request)
            if(result.count == 1)
            {
                let myObject : NSManagedObject = result.first! as! NSManagedObject
                myObject.setValue(txtflcontactNo.text, forKey: "contactNo")
                do
                {
                    try context.save()
                }
                catch
                {
                    print(error.localizedDescription)
                }
                print("updated succefully")
            }
        }
        catch{
            print("Update: Success")
        }
        
    }
    
    @IBAction func vtshow(_ sender: UIButton) {
        
        let next = self.storyboard?.instantiateViewController(withIdentifier: "nextViewController")as!
        nextViewController
        navigationController?.pushViewController(next, animated: true)
        next.empname = empinfo
        next.empno = empinfo1
        next.empdepartno = empinfo2
        next.empcontactno = empinfo3
        next.empsalary = empinfo4
        /* empno = [String]()
          empdepartno = [String]()
         empcontactno = [String]()
          empsalary = [Double]()*/
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        readFromCoreData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func readFromCoreData()
    {
        let context = delegate.persistentContainer.viewContext;
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        do
        {
           let result = try! context.fetch(request)
            for data in result as! [NSManagedObject]
            {
                let str = data.value(forKey: "name")as! String
                let str1 = data.value(forKey: "employeeNo")as! String
                let str2 = data.value(forKey: "departmentNo")as! String
                let str3 = data.value(forKey: "contactNo")as! String
                let str4 = data.value(forKey: "salary")as! Double
                print(str)
                print(str1)
                print(str2)
                empinfo.append(str)
                empinfo1.append(str1)
                empinfo2.append(str2)
                empinfo3.append(str3)
                empinfo4.append(str4)
                print("name of the name",empinfo)
                print("name of the employeeNo",empinfo1)
                print("name of the departNo",empinfo2)
                print("name of contactNo",empinfo3)
                print("salary of employee",empinfo4)
            }
        }
            catch{
                print(error.localizedDescription)
            }
        }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

