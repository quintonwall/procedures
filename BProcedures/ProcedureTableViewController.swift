//
//  ProcedureTableViewController.swift
//  BProcedures
//
//  Created by Quinton Wall on 8/22/17.
//  Copyright © 2017 Quinton Wall. All rights reserved.
//

import UIKit
import SwiftlySalesforce

class ProcedureTableViewController: UITableViewController {
    
    var procedures : [Procedure] = []
    var selectedProcedure : Procedure!
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        fetchProcedures()
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Procedures"
        
        let singletap = UITapGestureRecognizer(target: self, action: #selector(singleTapDetected))
        singletap.numberOfTapsRequired = 1
        //singletap.require(toFail: doubletaps) //otherwidr singletap always gets called.
        self.tableView.addGestureRecognizer(singletap)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchProcedures() {
        let start = DispatchTime.now()
        first {
            ProcedureData.shared.getAllProcedures()
            }.then {
                (results) -> () in
                
                let end = DispatchTime.now()
                let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
                let timeInterval = Double(nanoTime) / 1_000_000_000 // Technically could overflow for long running tests
               // print("Time to fetch \(results.count) procedures : \(timeInterval) seconds")
                
                self.procedures = results
                self.title = " \(results.count) procedures : \(timeInterval.rounded(toPlaces: 2)) seconds"
               self.tableView.reloadData()
            }.catch {
                (error) -> () in
                print("error: \(error)")  //todo: handle this better
        }
    }
        

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return procedures.count
    }

        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProcedureTableViewCell
            
            let p : Procedure = procedures[indexPath.row]
            cell.procedure = p
            cell.subject.text = p.Subject
            
            
            return cell
        }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
 
   /* override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedProcedure = procedures[indexPath.row]
        self.performSegue(withIdentifier: "startProcedureSteps", sender: self)
    }*/

    private func getCellFromTap(sender: UITapGestureRecognizer) -> ProcedureTableViewCell {
        let position: CGPoint =  sender.location(in: self.tableView)
        let indexPath: IndexPath = self.tableView.indexPathForRow(at: position)!
        let cell = tableView.cellForRow(at: indexPath) as? ProcedureTableViewCell
        
        return cell!
    }
    
    func singleTapDetected(sender : UITapGestureRecognizer) {
        let cell = getCellFromTap(sender: sender)
        selectedProcedure = cell.procedure
        performSegue(withIdentifier: "startProcedureSteps", sender: self)
    }
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "startProcedureSteps" {
            let detailsController = segue.destination as! StepViewController
            detailsController.procedureid = selectedProcedure.Id
            detailsController.parentProcedure = selectedProcedure
        }
    }
 

}
