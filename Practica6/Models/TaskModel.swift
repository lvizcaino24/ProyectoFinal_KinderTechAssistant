//
//  TaskModel.swift
//  Practica6
//
//  Created by CTA CUCEA on 7/4/19.
//  Copyright © 2019 MTI CUCEA. All rights reserved.
//

import Foundation

class TaskModel {
    var id: Int = 0
    var task: String
    var dueDate: Date
    
    init (task: String, dueDate: Date){
        self.task = task
        self.dueDate = dueDate
    }
}
