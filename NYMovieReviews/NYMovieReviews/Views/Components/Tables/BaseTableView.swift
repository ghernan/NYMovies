//
//  BaseTableView.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/13/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import UIKit

protocol BaseTableViewProtocol {
    associatedtype Cell: BaseTableViewCell
    func dequeueCell(for indexPath: IndexPath) -> Cell
}

class BaseTableView<Cell: BaseTableViewCell>: UITableView, BaseTableViewProtocol {
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.register(UINib.init(nibName: Cell.reusableIdentifier, bundle: nil), forCellReuseIdentifier: Cell.reusableIdentifier) 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dequeueCell(for indexPath: IndexPath) -> Cell {
        let cell = self.dequeueReusableCell(withIdentifier: Cell.reusableIdentifier, for: indexPath) as! Cell
        return cell
    }
}
