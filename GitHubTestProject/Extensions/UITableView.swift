//
//  UITableView.swift
//  GitHubTestProject
//
//  Created by Asmins on 17.07.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func registerCell(_ nibName: String, identifier: String) {
        let nib = UINib(nibName: nibName, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
}
