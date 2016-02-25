//
//  Trip.swift
//  RowingRouter
//
//  Created by block7 on 2/9/16.
//  Copyright © 2016 Calvin Terpstra. All rights reserved.
//

import Foundation

class Trip {
    
    private var time: Int
    private var routeName: String
    private var date: String
    
    init(time: Int, routeName: String, date: String){
        self.time = time
        self.routeName = routeName
        self.date = date
    }
    
    func getTime() -> Int {
        return time
    }
    
    func getRouteName() -> String {
        return routeName
    }
    
    func getDate() -> String {
        return date
    }
}