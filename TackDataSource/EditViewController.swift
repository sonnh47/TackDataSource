

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var lblCheckEmpty: UILabel!
    @IBOutlet weak var txtEditData: UITextField!
    var editData: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        if editData != nil{
       txtEditData.text = editData
        }

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if txtEditData.text != nil{
            editData = txtEditData.text
        }
    }
}
