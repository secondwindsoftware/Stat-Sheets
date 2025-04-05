//
//  TableCell.swift
//  Basketball App
//
//  Created by Len Springs
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet weak var txtStarter: UITextField!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var txtMin: UITextField!
    @IBOutlet weak var txtFGM_A: UITextField!
    @IBOutlet weak var txt3PM_A: UITextField!
    @IBOutlet weak var lblSrNo: UITextField!
    @IBOutlet weak var txtFTM_A: UITextField!
    @IBOutlet weak var txtOREB: UITextField!
    @IBOutlet weak var txtDREB: UITextField!
    @IBOutlet weak var txtREB: UITextField!
    @IBOutlet weak var txtAST: UITextField!
    @IBOutlet weak var txtSTL: UITextField!
    @IBOutlet weak var txtBLK: UITextField!
    @IBOutlet weak var txtTO: UITextField!
    @IBOutlet weak var txtPF: UITextField!
    @IBOutlet weak var txtPTS: UITextField!
    
    func clearData() {
        self.lblSrNo.text    = ""
        self.txtStarter.text = ""
        self.txtMin.text     = ""
        self.txtFGM_A.text   = ""
        self.txt3PM_A.text   = ""
        self.txtFTM_A.text   = ""
        self.txtOREB.text    = ""
        self.txtDREB.text    = ""
        self.txtREB.text     = ""
        self.txtAST.text     = ""
        self.txtSTL.text     = ""
        self.txtBLK.text     = ""
        self.txtTO.text      = ""
        self.txtPF.text      = ""
        self.txtPTS.text     = ""
    }
    
    var setData : PlayerModelClass! {
        didSet {
            self.lblSrNo.text    = setData.SrNo
            self.txtStarter.text = setData.Starter
            self.txtMin.text     = setData.Min
            self.txtFGM_A.text   = setData.FGM_A
            self.txt3PM_A.text   = setData.TPM_A
            self.txtFTM_A.text   = setData.FTM_A
            self.txtOREB.text    = setData.OREB
            self.txtDREB.text    = setData.DREB
            self.txtREB.text     = setData.REB
            self.txtAST.text     = setData.AST
            self.txtSTL.text     = setData.STL
            self.txtBLK.text     = setData.BLK
            self.txtTO.text      = setData.TO
            self.txtPF.text      = setData.PF
            self.txtPTS.text     = setData.PTS
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
