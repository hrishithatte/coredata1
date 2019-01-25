//
//  nextViewController.swift
//  coredata1
//
//  Created by Student-001 on 13/12/18.
//  Copyright © 2018 ra. All rights reserved.
//

import UIKit
import CoreData
class nextViewController: UIViewController, UITableViewDataSource ,UITableViewDelegate{
    var empname = [String]()
    var empno = [String]()
    var empdepartno = [String]()
    var empcontactno = [String]()
    var empsalary = [Double]()
    
    /* @IBOutlet weak var lbname: UILabel!
     
     @IBOutlet weak var lbemployID: UILabel!
     
     @IBOutlet weak var lbcontnmbr: UILabel!
     
     @IBOutlet weak var lbldep: UILabel!*/
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return empname.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")as! cellTableViewCell
        cell.lbname.text = empname[indexPath.row]
        cell.lbemployID.text = empno[indexPath.row]
        cell.lbcontnmbr.text = empcontactno[indexPath.row]
        cell.lbldep.text = empdepartno[indexPath.row]
        return cell
    }
    
    
    @IBOutlet weak var tblvwdatshow: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblvwdatshow.dataSource = self
        tblvwdatshow.delegate = self
        tblvwdatshow.reloadData()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
     
        tblvwdatshow.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
