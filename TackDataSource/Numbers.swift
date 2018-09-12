//
//  DataSource.swift
//  TackDataSource
//
//  Created by Son on 8/9/18.
//  Copyright © 2018 NguyenHoangSon. All rights reserved.
//

import UIKit


class Numbers: NSObject, UITableViewDataSource {

    var arrListNumbers = Array(1...5)
     var tableViewController: TableViewController?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return arrListNumbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(arrListNumbers[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrListNumbers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableViewController?.hasNoData = arrListNumbers.count == 0
            
        }
    }
}
