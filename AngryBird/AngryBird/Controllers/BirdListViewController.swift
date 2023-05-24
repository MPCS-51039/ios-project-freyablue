//
//  ViewController.swift
//  AngryBird
//
//  Created by Yijia chen on 2023/3/31.
//

import UIKit

//class TabBarController:UITabBarController{
//
//    @IBInspectable var initialIndex:Int = 1
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        selectedIndex = initialIndex
//        view.backgroundColor = .lightGray
//        let vc1 = BirdListViewController()
//        let vc2 = SecondViewController()
//        let vc3 = ThirdViewController()
//        let vc4 = FourthViewController()
//        vc1.title = "Cell"
//        vc2.title = "Home"
//        vc3.title = "Favourite"
//        vc4.title = "About"
//        self.setViewControllers([vc1, vc2,vc3,vc4], animated: false)
//        guard let items = self.tabBar.items else { return }
//        let icon_images = ["heart","house","star","bell"]
//        for x in 0...3 {
//            items[x].image = UIImage(systemName: icon_images[x])
//        }
//        self.tabBar.tintColor = .black
//
//        present(self,animated: true)
//    }
//
//
//}
class BirdListViewController: UIViewController{
    
    

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var flock:[Bird] = []
    var birdService: BirdService!
    var searching = false
    var searchedWhale:[Bird] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.birdService = BirdService()

        self.tableView.dataSource = self
        self.tableView.delegate = self



        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true




        configureSearchController()
        
        
        
    }
    
    
    private func configureSearchController(){
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Search Whale by name"
        
    }
    
    override func viewWillAppear(_ animated:Bool){
        
        
        
        guard let confirmedService = self.birdService else {return}
        confirmedService.getBirds(completion: { birds, error in
            guard let birds = birds, error == nil else{
                //print(error)
                if(birds == nil && confirmedService.wrongUrl==true) {
                    let my_alert = UIAlertController(title: "Alert", message: "API call doesn't work, unable to fetch instances", preferredStyle: .alert)
                    my_alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(my_alert, animated: true, completion:{return})
                }
                if(birds == nil && confirmedService.emptyContent==true) {
                    let my_alert = UIAlertController(title: "Alert", message: "Empty Content", preferredStyle: .alert)
                    my_alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(my_alert, animated: true, completion:{return})
                }

                return
            }
            self.flock = birds

            self.tableView.reloadData()
            
        })
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let destination = segue.destination as? DetailViewController,
            let selectedIndexPath = self.tableView.indexPathForSelectedRow,
            let confirmed = self.tableView.cellForRow(at: selectedIndexPath) as? BirdCell else {return}
        
        let confirmedBird = confirmed.bird
        destination.bird = confirmedBird
                    
                
        
    }
}




extension BirdListViewController: UITableViewDataSource, UISearchBarDelegate, UISearchResultsUpdating {
    public func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty{
            searching = true
            searchedWhale.removeAll()
            for whale in self.flock{
                if whale.name.lowercased().contains(searchText.lowercased()){
                    searchedWhale.append(whale)
                }
            }
        }
        else{
            searching=false
            searchedWhale.removeAll()
            searchedWhale = self.flock
        }
        tableView.reloadData()
    }

    //MARK: DataSource

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return searchedWhale.count
        }
        else{
            return self.flock.count
        }
    }


    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = self.tableView.dequeueReusableCell(withIdentifier: "birdCell") as! BirdCell

        let curr = self.flock[indexPath.row]
        if searching
        {
            cell.bird = searchedWhale[indexPath.row]
        }
        else{
            cell.bird = curr

        }


        activityIndicator.stopAnimating()

        return cell
    }

    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchedWhale.removeAll()

    }

}

extension BirdListViewController: UITableViewDelegate {
    //MARK: Delegate
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if
//            let cell = self.tableView.cellForRow(at: indexPath) as? BirdCell,
//            let confirmedBird = cell.bird
//        {
//            confirmedBird.confirmedSighting = true
//            cell.accessoryType = confirmedBird.confirmedSighting ? .checkmark : .none
//        }
//    }
//
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//        let cell = self.tableView.cellForRow(at: indexPath) as! BirdCell
//        let img = UIImageView(frame:CGRect(x: 0, y: 65, width: 25, height: 30))
//        img.image = UIImage(systemName: "sun.max.fill")
//        img.tintColor = .systemYellow
//
//
//        let confirmedAction = UIContextualAction(style: .normal, title:"Confirmed"){
//            (action, view, completionHandler) in cell.accessoryView = img
//            completionHandler(true)
//        }
//        let cancelAction = UIContextualAction(style: .normal, title:"Cancel"){
//            (action, view, completionHandler) in cell.accessoryView = .none
//            completionHandler(true)
//        }
//
//        confirmedAction.backgroundColor = UIColor.brown
//        confirmedAction.image = UIImage(named: "heart")
//
//
//
//        cancelAction.backgroundColor = UIColor.gray
//        let act = UISwipeActionsConfiguration(actions: [cancelAction,confirmedAction])
//        act.performsFirstActionWithFullSwipe = false
//        return act
//    }
    
    
}
