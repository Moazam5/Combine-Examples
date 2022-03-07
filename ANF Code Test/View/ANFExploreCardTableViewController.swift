//
//  ANFExploreCardTableViewController.swift
//  ANF Code Test
//

import UIKit

class ANFExploreCardTableViewController: UITableViewController {

  //  var viewModel: MainViewModel
    let service = ProductsService.shared

    var data : [DataModel]? = nil
//    init(viewModel: MainViewModel) {
//      //  self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//
//    }

//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {

        tableView.register(FeedItemCell.nib(), forCellReuseIdentifier: Constants.feedItemCellIdentifier)
        tableView.rowHeight = 400

        service.sendRequest { [weak self] data in
            self?.data = data

            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

}

extension ANFExploreCardTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  //       viewModel.productData.count
        return data?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: Constants.feedItemCellIdentifier, for: indexPath) as! FeedItemCell
       print( data?[indexPath.row].topDescription)
       // cell.topDescription.text = "Hi"
        cell.configure(with: data![indexPath.row])


//        if let data = data {
//          //  cell.backgroundImage = data[indexPath.row].backgroundImage
//            cell.topDescription.text = data[indexPath.row].topDescription
//        }

     //   cell.configure(with: <#T##DataModel#>)

//        if let titleLabel = cell.viewWithTag(1) as? UILabel,
//           let titleText = exploreData?[indexPath.row]["title"] as? String {
//            titleLabel.text = titleText
//        }
//
//
//        if let imageView = cell.viewWithTag(2) as? UIImageView,
//           let name = exploreData?[indexPath.row]["backgroundImage"] as? String,
//           let image = UIImage(named: name) {
//            imageView.image = image
//        }
//
//        if let firstLabel = cell.viewWithTag(3) as? UILabel {
//            firstLabel.text = "Bitch"
//            firstLabel.textColor = .red
//            firstLabel.backgroundColor = .brown
//        }
        return cell
    }
}
