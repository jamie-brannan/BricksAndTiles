//
//  ExampleListViewController.swift
//  Example
//
//  Created by Pedro M. Zaroni on 16/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit

final class ExampleListViewController: UIViewController {

    private lazy var tableView = UITableView.standard()

    private let presenter = ExampleListPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        title = "TableViewFactory"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.view.addSubviewWithConstraints(subview: tableView)

        presenter.setupDataSource(in: tableView)
    }
}

extension ExampleListViewController: ExampleListViewDelegate {
    func showExample(forType type: ExampleType, isEditable: Bool) {
        guard type != .dragable else {
            return showDraggableExample()
        }
        let presenter = GenericExamplePresenter(type: type)
        let view = GenericExampleViewController(presenter: presenter)
        view.toggleEditable(isEditable)
        self.navigationController?.pushViewController(view, animated: true)
    }

    private func showDraggableExample() {
        let view = DraggableViewController()
        self.navigationController?.pushViewController(view, animated: true)
    }
}
