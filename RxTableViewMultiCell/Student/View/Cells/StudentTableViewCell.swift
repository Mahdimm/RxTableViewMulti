//
//  StudentTableViewCell.swift
//  RxTableViewMultiCell
//
//  Created by Mahdi Mahjoobe on 12/28/18.
//  Copyright © 2018 Mahdi Mahjoobe. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var lastNameLbl: UILabel!
    
    var viewModel: Student? {
        didSet {
            bindViewModel()
        }
    }
    
    private func bindViewModel() {
        nameLbl.text = "Name: \(viewModel!.name)"
        lastNameLbl.text = "LastName: \(viewModel!.lastName)"
    }
    
}
