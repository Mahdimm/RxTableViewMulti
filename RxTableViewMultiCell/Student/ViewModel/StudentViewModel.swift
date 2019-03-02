//
//  ViewModel.swift
//  RxTableViewMultiCell
//
//  Created by Mahdi Mahjoobe on 12/27/18.
//  Copyright © 2018 Mahdi Mahjoobe. All rights reserved.
//

import Foundation
import RxSwift
import RxDataSources

typealias SectionOfStudent = SectionModel<TableViewSection,TableViewItem>

enum TableViewSection {
    case main
}

enum TableViewItem {
    case student(info: Student)
    case teacher(info: Teacher)
}

class StudentViewModel {
    let items = PublishSubject<[SectionOfStudent]>()
    
    func getInformation() {
        var subItems = [TableViewItem]()
        
        //server call
        //database query
        
        subItems = ([
            .student(info: Student(name: "Liam", lastName: "swift")),
            .teacher(info: Teacher(name: "Emma", lastName: "Das", major: "Math")),
            .student(info: Student(name: "Ava", lastName: "Banks")),
            .teacher(info: Teacher(name: "Bill", lastName: "Cooper", major: "Math")),
            .student(info: Student(name: "Caden", lastName: "Smith")),
            .teacher(info: Teacher(name: "Isabella", lastName: "Watson", major: "Math")),
        ])
        
        items.onNext([SectionOfStudent(model: .main, items: subItems)])
    }
}
