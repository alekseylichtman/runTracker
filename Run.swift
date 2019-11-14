//
//  Run.swift
//  Walk Distance Count
//
//  Created by Oleksii Kolakovskyi on 11/13/19.
//  Copyright © 2019 Aleksey. All rights reserved.
//

import Foundation
import UIKit

var runs = [Run]()


class Run: NSObject, NSCoding {
    
    var distance: String
    var steps: String
    var time: String
    var date: Date
    
    
   // static let date = Date()
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
    
    
    
    init(distance: String, steps: String, time: String, date: Date) {
        
        self.distance = distance
        self.steps = steps
        self.time = time
        self.date = date
    }
    
    
    required init?(coder: NSCoder) {
        self.distance = coder.decodeObject(forKey: "distance") as! String
        self.steps = coder.decodeObject(forKey: "steps") as! String
        self.time = coder.decodeObject(forKey: "time") as! String
        self.date = coder.decodeObject(forKey: "date") as! Date
        
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(distance, forKey: "distance")
        coder.encode(steps, forKey: "steps")
        coder.encode(time, forKey: "time")
        coder.encode(date, forKey: "date")
        
        
    }
    
    static func loadSavedRuns() {
        let encodedData = UserDefaults.standard.object(forKey: "runs") as? Data
        if encodedData != nil {
            let local_runs = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(encodedData!) as? [Run]
            runs = (local_runs ?? [])
        } else {
            runs = []
        }
    }
    
    
    static func saveRun(distance: String, steps: String, time: String, date: Date) -> Run {
        
        let newRun = Run(distance: distance,
                         steps: steps,
                         time: time,
                         date: date)
        runs.append(newRun)

        
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: runs)
        UserDefaults.standard.setValue(encodedData, forKeyPath: "runs")
        UserDefaults.standard.synchronize()
        
        return newRun
        
    }
        
        
        
        
        func saveOnDevice(){
        
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: runs)
              UserDefaults.standard.setValue(encodedData, forKeyPath: "runs")
              UserDefaults.standard.synchronize()
        }
        
        
    }
    



