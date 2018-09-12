//
//  Names.swift
//  TackDataSource
//
//  Created by Son on 8/9/18.
//  Copyright © 2018 NguyenHoangSon. All rights reserved.
//

import Foundation
import UIKit

class Names: NSObject, UITableViewDataSource{
    
    var arrNames = ["Nguyen Hoang SOn", "Nguyen Van Hoang", "Hoang Dao Tac"]
     var tableViewController: TableViewController?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell.textLabel?.text = arrNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
           // let showNoDataNames = arrNames.count == 0
            tableViewController?.hasNoData = arrNames.count == 0
            
        }
    }
}
