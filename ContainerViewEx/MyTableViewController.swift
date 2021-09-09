//
//  MyTableViewController.swift
//  ContainerViewEx
//
//  Created by 김종권 on 2021/09/09.
//

import UIKit

class MyTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)

        print("MyTableViewController didMove 호출 parent(\(parent)) !!!")
    }

    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)

        print("MyTableViewController willMove 호출 parent(\(parent)) !!!")
    }
}
