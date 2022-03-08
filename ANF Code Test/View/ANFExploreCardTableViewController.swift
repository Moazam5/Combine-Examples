//
//  ANFExploreCardTableViewController.swift
//  ANF Code Test
//

import UIKit
import Combine

class ANFExploreCardTableViewController: UITableViewController {

    var viewModel: MainViewModelImpl!
    let service = ProductsService()
    var data : [DataModel] = []
    private var subscriber: AnyCancellable?

    override func viewDidLoad() {

        tableView.register(FeedItemCell.nib(), forCellReuseIdentifier: Constants.feedItemCellIdentifier)
      //  tableView.rowHeight = 400
        setupViewModel()
        fetchData()
        observeViewModel()
    }

    private func setupViewModel() {
        viewModel = MainViewModelImpl(service: service, endpoint: .homeScreenInfoFetch)
    }

    private func fetchData() {
        viewModel.fetchData()
    }

   private func observeViewModel() {
       subscriber =  viewModel.userSubject.sink { completion in
           switch completion {
           case .failure(let error):
               print(error.localizedDescription)
           default:
               break
           }
       } receiveValue: { data in
           DispatchQueue.main.async {
               self.data = data
               self.tableView.reloadData()
           }
       }
    }
}

extension ANFExploreCardTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: Constants.feedItemCellIdentifier, for: indexPath) as! FeedItemCell
        cell.configure(with: data[indexPath.row])
        return cell
    }
}
