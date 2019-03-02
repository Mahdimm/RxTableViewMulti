//
//  TeacherTableViewCell.swift
//  RxTableViewMultiCell
//
//  Created by Mahdi Mahjoobe on 12/28/18.
//  Copyright © 2018 Mahdi Mahjoobe. All rights reserved.
//

import UIKit

class TeacherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var lastNameLbl: UILabel!
    @IBOutlet weak var majorLbl: UILabel!
    
    var viewModel: Teacher? {
        didSet {
            bindViewModel()
        }
    }
    
    private func bindViewModel() {
        nameLbl.text = "Name: \(viewModel!.name)"
        lastNameLbl.text = "LastName: \(viewModel!.lastName)"
        majorLbl.text = viewModel?.major
    }
    
}
