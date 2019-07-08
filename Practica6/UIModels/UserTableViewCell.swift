//
//  UserTableViewCell.swift
//  Practica6
//
//  Created by CTA CUCEA on 6/17/19.
//  Copyright © 2019 MTI CUCEA. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblInvitados: UILabel!
    @IBOutlet weak var stepperInvitado: UIStepper!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /*@IBAction func invitar(_ sender: UISwitch) {
        if sender.isOn {
            stepperInvitado.isEnabled = true
        } else {
            stepperInvitado.isEnabled = false
            stepperInvitado.value = 0
            //lblInvitados.text = "0"
        }
    }
    
    @IBAction func agregarInvitados(_ sender: UIStepper) {
        //lblInvitados.text = stepperInvitado.value.description
        
    }*/
    
}
