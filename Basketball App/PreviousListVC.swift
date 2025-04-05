//
//  PreviousListVC.swift
//  Basketball App
//
//  Created by Len Springs
//

import UIKit
import CoreData

class PreviousListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var btnDelete: UIBarButtonItem!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var lblNoData: UILabel!
    
    var delegate : MatchDetails?
    var arrPlayer = [[PlayerModelClass]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblView.tableFooterView = UIView()
        self.fetchData()
    }
    
    //MARK:- Methods
    func fetchData()  {
        let set = CoreDataManager.sharedManager.fetchData()
        if set.count != 0 {
            self.arrPlayer = set
            self.lblNoData.isHidden = true
            self.tblView.isHidden = false
            self.btnDelete.isEnabled = true
            self.tblView.reloadData()
        }else {
            self.lblNoData.isHidden = false
            self.tblView.isHidden = true
            self.btnDelete.isEnabled = false
            print("NO DATA")
        }
    }
    
    func deleteAllData(entity: String){
        let status =  CoreDataManager.sharedManager.deleteAllTest()
        var alert : UIAlertController?
        if status {
            alert = UIAlertController(title: "Message", message: "Deleted Successfully", preferredStyle: .alert)
        }else{
            alert = UIAlertController(title: "Alert", message: "Something went wrong", preferredStyle: .alert)
        }
        alert?.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (UIAlertAction) in
            self.fetchData()
        }))
        self.present(alert!, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrPlayer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PreviousListCell", for: indexPath) as! PreviousListCell
        cell.lblName.text = "Match No : " + "\(indexPath.row + 1)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.perviousMatchDetails(data: self.arrPlayer[indexPath.row])
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    //MARK:- Action Methods
    @IBAction func btnDeleteAll(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Confirm Delete", message: "Are you sure want to delete all data?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (UIAlertAction) in
            self.deleteAllData(entity: "Player")
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

//MARK:- Previous List
class PreviousListCell: UITableViewCell {
    @IBOutlet weak var lblName:UILabel!
}

protocol MatchDetails {
    func perviousMatchDetails(data:[PlayerModelClass])
}
