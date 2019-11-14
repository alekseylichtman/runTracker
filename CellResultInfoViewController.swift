//
//  CellResultInfoViewController.swift
//  Walk Distance Count
//
//  Created by Oleksii Kolakovskyi on 11/13/19.
//  Copyright © 2019 Aleksey. All rights reserved.
//

import UIKit

class CellResultInfoViewController: UIViewController {

    var run: Run!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = "\(Run.dateFormatter.string(from: run.date))"
        distanceLabel.text = "Distance \(run.distance)"
        timeRanedLabel.text = "Time: \(run.time)"
        stepsLabel.text = "\(run.steps) steps made"
        
    }
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var timeRanedLabel: UILabel!
    @IBOutlet weak var stepsLabel: UILabel!
        
        
    }

