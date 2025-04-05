//
//  ViewController.swift
//  Basketball App
//
//  Created by Len Springs
//

import UIKit
import CoreData


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MatchDetails {
     
    @IBOutlet weak var btnSave: UIBarButtonItem!
    @IBOutlet weak var distblHt: NSLayoutConstraint!
    @IBOutlet weak var tblView: UITableView!
    
    var player: [NSManagedObject] = []
    var arrData = [PlayerModelClass]()
    var isPrevious = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblView.register(UINib(nibName: "TableCell", bundle: nil), forCellReuseIdentifier: "TableCell")
        self.tblView.tableFooterView = UIView()
    }

    //Mark: Table View
    func perviousMatchDetails(data: [PlayerModelClass]) {
        self.btnSave.image = #imageLiteral(resourceName: "new")
        self.isPrevious = true
        self.arrData = data
        self.tblView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)?.first as? UIView
            return headerView
        }else{
            let headerView = Bundle.main.loadNibNamed("HeaderView2", owner: self, options: nil)?.first as? UIView
            return headerView
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
           return  5
        }else {
            return 7
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! TableCell
        print("Section ****" + "\(indexPath.section)")
        print("Row ****" + "\(indexPath.row)")
        
        var ind = 0
        if indexPath.section == 0 {
            ind = indexPath.row
        }else{
            ind = indexPath.row + 5
        }
        
        if isPrevious {
            cell.setData = self.arrData[ind]
        }else{
            cell.clearData()
        }
        
        if (indexPath.row % 2 == 0) {
            cell.bgView.backgroundColor = .white
        }
        else{
            cell.bgView.backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.968627451, blue: 0.9490196078, alpha: 1)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewWillLayoutSubviews()
    }
    
    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        DispatchQueue.main.async {
            self.distblHt.constant = self.tblView.contentSize.height
        }
        self.view.layoutIfNeeded()
    }
    
    func saveData() {
        var val = [PlayerModelClass]()
        for section in 0 ..< self.tblView.numberOfSections {
            for row in 0 ..< self.tblView.numberOfRows(inSection: section) {
                let indexPath = IndexPath(row: row, section: section)
                let cell = self.tblView.cellForRow(at: indexPath as IndexPath) as! TableCell
                let of = PlayerModelClass(SrNo: cell.lblSrNo.text ?? "",
                                            Starter: cell.txtStarter.text ?? "",
                                           Min: cell.txtMin.text ?? "",
                                           FGM_A: cell.txtFGM_A.text ?? "",
                                           TPM_A: cell.txt3PM_A.text ?? "",
                                           FTM_A: cell.txtFTM_A.text ?? "",
                                           OREB:cell.txtOREB.text ?? "",
                                           DREB: cell.txtDREB.text ?? "",
                                           REB: cell.txtREB.text ?? "",
                                           AST: cell.txtAST.text ?? "",
                                           STL: cell.txtSTL.text ?? "",
                                           BLK: cell.txtBLK.text ?? "",
                                           TO: cell.txtTO.text ?? "",
                                           PF: cell.txtPF.text ?? "",
                                           PTS: cell.txtPTS.text ?? "")
                val.append(of)
            }
        }
        var data:Data?
        do {
             data = try NSKeyedArchiver.archivedData(withRootObject: val, requiringSecureCoding: false)
        } catch {
            print(error)
        }
        let test  = CoreDataManager.sharedManager.insertPlayer(data: data!)
        print(test ?? "")
    }
  
    //MARK:- Action Methods
    @IBAction func saveAction(_ sender: Any) {
        if self.isPrevious {
            self.arrData.removeAll()
            self.isPrevious = false
            self.btnSave.image = #imageLiteral(resourceName: "floppy-disk (1)")
            self.tblView.reloadData()
        }else{
            let alert = UIAlertController(title: "Confirm Save", message: "Are you sure want to save data", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (UIAlertAction) in
                self.saveData()
                self.isPrevious = false
                self.arrData.removeAll()
                self.tblView.reloadData()
            }))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnPreviousList(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "PreviousListVC") as! PreviousListVC
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

