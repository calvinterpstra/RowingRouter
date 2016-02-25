//
//  TimeTable.swift
//  RowingRouter
//
//  Created by block7 on 2/4/16.
//  Copyright © 2016 Calvin Terpstra. All rights reserved.
//

import Foundation

class TimeTable {
    
    private var timeTable: NSMutableArray
    private var identity: String
    
    init(timeTable: NSMutableArray, identity: String){
        self.identity = identity
        self.timeTable = timeTable
    }

    func addRoute(trip: Trip){
        timeTable.addObject(trip)
    }
    
    func printArray(timeTableArray: TimeTable){
        print("printing table ...")
        for(var i = 0; i < timeTableArray.getTable().count; i++){
            print("time: " + "\((timeTableArray.getTable()[i] as! Trip).getTime())" )
            print("route name: " + "\((timeTableArray.getTable()[i] as! Trip).getRouteName())" )
            print("date: " + "\((timeTableArray.getTable()[i] as! Trip).getDate())" )
        }
        print("done")
    }
    
    func getTable() -> NSMutableArray{
        return timeTable
    }
    
}
