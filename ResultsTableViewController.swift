//
//  ResultsTableViewController.swift
//  Walk Distance Count
//
//  Created by Oleksii Kolakovskyi on 11/13/19.
//  Copyright © 2019 Aleksey. All rights reserved.
//

import UIKit
import Foundation

class ResultsTableViewController: UITableViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Run.loadSavedRuns()
        tableView.reloadData()
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        runs.sort { (run1, run2) -> Bool in
            run1.date > run2.date
            
        }
    }
    
    func saveOnDevice(){
    
    let encodedData = NSKeyedArchiver.archivedData(withRootObject: runs)
          UserDefaults.standard.setValue(encodedData, forKeyPath: "runs")
          UserDefaults.standard.synchronize()
    }
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return runs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell(style: .subtitle, reuseIdentifier: "cellForRunInfo")
        cell.textLabel!.text =  Run.dateFormatter.string(from: runs[indexPath.row].date)
        cell.detailTextLabel?.text = runs[indexPath.row].distance
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showDetails", sender: nil)
        
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            runs.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
            saveOnDevice()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetails" {
            let resultsController = segue.destination as! CellResultInfoViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let selectedRun = runs[indexPath.row]
            resultsController.run = selectedRun
            
            
            
            
        }
    }
}
