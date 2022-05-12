//
//  OfferListViewController.swift
//  Checkout 51 test
//
//  Created by yuehengshi on 2022-05-11.
//

import UIKit

class OfferListViewController: UITableViewController, UISearchBarDelegate {

    
    var viewModel = OfferListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getAllOffers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navConfig()
    }

    private func navConfig(){
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .checkout51_green
            appearance.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.white]
            navigationController?.navigationBar.standardAppearance = appearance;
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        }
        self.navigationItem.title = "Checkout 51"
        self.navigationController?.setTintColor(.white)
        self.navigationController?.backgroundColor(.checkout51_green)
        self.setRightBarButtonItem(.sort_white!, #selector(showSortMenu))
    }
    
    @objc func showSortMenu(){
        let alert = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet
        )

        alert.addAction(
            .init(title: "Sort by Name", style: .default) { _ in
                self.viewModel.sortOffersByName()
            }
        )

        alert.addAction(
            .init(title: "Sort by Cashback", style: .default) { _ in
                self.viewModel.sortOffersByCashback()
            }
        )
        
        alert.addAction(
            .init(title: "Reset", style: .default) { _ in
                self.viewModel.sortReset()
            }
        )
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        present(alert, animated: true)
    }
   

}

// MARK: - TransactionViewModelDelegate
extension OfferListViewController: OfferViewModelDelegate {
    func offersChanged() {
        self.tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate
extension OfferListViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.getCell(tableView: tableView, cellForRowAt: indexPath)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    
}
