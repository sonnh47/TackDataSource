

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var NoDataView: UIView!
    @IBOutlet weak var FooterView: UIView!
    @IBOutlet weak var switchOnOff: UISwitch!
    var showNumbers = Numbers()
    var showNames = Names()
    var hasNoData: Bool = true {
        didSet{
            hasNoData ? (tableView.tableFooterView = NoDataView):(tableView.tableFooterView = FooterView)
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = showNumbers
        showNumbers.tableViewController = self
        showNames.tableViewController = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        switchOnOff.isOn ? (hasNoData = showNumbers.arrListNumbers.count == 0):(hasNoData = showNames.arrNames.count == 0)
        tableView.reloadData()
    }
    // show data  on table view
    @IBAction func switchSexyData(_ sender: UISwitch) {
        if sender.isOn {
            tableView.dataSource = showNumbers
            hasNoData = showNumbers.arrListNumbers.count == 0
        }
        else {
            tableView.dataSource = showNames
            hasNoData = showNames.arrNames.count == 0
        }
        tableView.reloadData()
    }
    // segue data to other viewcontroller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       let editViewcontroller = segue.destination as? EditViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            if switchOnOff.isOn {
                editViewcontroller?.editData =  String(showNumbers.arrListNumbers[indexPath.row])
            }
            else {
                editViewcontroller?.editData = showNames.arrNames[indexPath.row]
            }
        }
    }
    
    //edit and add
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        
        let editViewcontroller = unwindSegue.source as? EditViewController
        let data = editViewcontroller?.editData
        if let indexPath = tableView.indexPathForSelectedRow {
            switchOnOff.isOn ? (showNumbers.arrListNumbers[indexPath.row] = Int(data ?? "") ?? 0 ) : (showNames.arrNames[indexPath.row] = (data ?? ""))

    }
        else {
            switchOnOff.isOn ? (showNumbers.arrListNumbers.append(Int(data ?? "") ?? 0)) : (showNames.arrNames.append(data ?? "0") )
        }
        tableView.reloadData()
    }
}
