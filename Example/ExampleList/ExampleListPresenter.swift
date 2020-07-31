//
//  ExampleListPresenter.swift
//  Example
//
//  Created by Pedro M. Zaroni on 16/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import TableViewFactory

protocol ExampleListViewDelegate: AnyObject {
    func showDragableExample()
    func showSingleSelectionExample()
    func showEditableExample()
    func showAlternateStaticExample()
    func showCollectionViewExample()
}

class ExampleListPresenter {

    var dataSource: TableViewDataSource?

    weak var view: ExampleListViewDelegate?

    func setupDataSource(in tableView: UITableView) {
        self.dataSource = TableViewDataSource(
            sections: ExampleListTableViewFactory(didSelect: { [weak self] type in
                self?.showExample(for: type)
            }).make(),
            tableView: tableView
        )
    }

    private func showExample(for type: ExampleType) {
        switch type {
        case .dragable:
            view?.showDragableExample()
        case .singleSelection:
            view?.showSingleSelectionExample()
        case .editable:
            view?.showEditableExample()
        case .alternateStatic:
            view?.showAlternateStaticExample()
//        case .collectionView:
//            view?.showCollectionViewExample()
        }
    }
}
