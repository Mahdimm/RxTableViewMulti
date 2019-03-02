//
//  ViewController.swift
//  RxTableViewMultiCell
//
//  Created by Mahdi Mahjoobe on 12/27/18.
//  Copyright © 2018 Mahdi Mahjoobe. All rights reserved.
//

import UIKit
import RxDataSources
import RxSwift
import RxCocoa

class StudentViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private let bag = DisposeBag()
    private let viewModel = StudentViewModel()
    
    private lazy var dataSource = RxTableViewSectionedReloadDataSource<SectionOfStudent>(configureCell: configureCell)
    private lazy var configureCell: RxTableViewSectionedReloadDataSource<SectionOfStudent>.ConfigureCell = { [unowned self] (dataSource, tableView, indexPath, item) in
        
        switch item {
        case .student(let info):
            return self.configStudentCell(student: info, atIndex: indexPath)
        case .teacher(let info):
            return self.configTeacherCell(teacher: info, atIndex: indexPath)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rx.setDelegate(self).disposed(by: bag)
        tableView.bounces = false
        tableView.register(UINib(nibName: "StudentTableViewCell", bundle: nil), forCellReuseIdentifier: "StudentTableViewCell")
        tableView.register(UINib(nibName: "TeacherTableViewCell", bundle: nil), forCellReuseIdentifier: "TeacherTableViewCell")
        
        viewModel.items
        .bind(to: tableView.rx.items(dataSource: dataSource))
        .disposed(by: bag)
        
        viewModel.getInformation()
    }
    
}

extension StudentViewController {
    
    func configStudentCell(student: Student, atIndex: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "StudentTableViewCell", for: atIndex) as? StudentTableViewCell else {
            return UITableViewCell()
        }
        cell.viewModel = student
        return cell
    }
    
    func configTeacherCell(teacher: Teacher, atIndex: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "TeacherTableViewCell", for: atIndex) as? TeacherTableViewCell else {
            return UITableViewCell()
        }
        cell.viewModel = teacher
        return cell
    }
    
}

extension StudentViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
