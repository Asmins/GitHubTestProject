
//
//  HomeViewController.swift
//  GitHubTestProject
//
//  Created by Asmins on 16.07.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!

    var viewModel: HomeViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = FactoryViewModel().createViewModel(.home) as? HomeViewModel
        viewModel?.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func searchButton(_ sender: Any) {
        viewModel?.getListRepositoriesFor(nameTextField.text!)
    }
}

extension HomeViewController: ActionFromViewController {
    
    func showAlertWith(_ title: String, message: String) {
        let controller = UIAlertController().alertControllerWith(title, message: message)
        self.present(controller, animated: true, completion: nil)
    }

    func openRepostoriesView(_ repos: [Repository]) {
        let controller = Router().openViewController(.reposotoryViewController) as! RepositoriesViewController
        controller.viewModel?.getData(repos)
        self.navigationController?.show(controller, sender: self)
    }
}
