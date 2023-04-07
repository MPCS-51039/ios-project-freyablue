//
//  ViewController.swift
//  AngryBird
//
//  Created by Yijia chen on 2023/3/31.
//

import UIKit

class BirdListViewController: UIViewController{
    
    

    
    @IBOutlet weak var tableView: UITableView!
    
    var flock:[Bird] = []
    var birdService: BirdService!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.birdService = BirdService()
        self.flock = self.birdService.getBirds()
        
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
    
}

extension BirdListViewController: UITableViewDataSource {
    //MARK: DataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.flock.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "birdCell") as! BirdCell
        let curr = self.flock[indexPath.row]
        
        cell.bird = curr
        
        return cell
    }
    
}

extension BirdListViewController: UITableViewDelegate {
    //MARK: Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if
            let cell = self.tableView.cellForRow(at: indexPath) as? BirdCell,
            let confirmedBird = cell.bird
        {
            confirmedBird.confirmedSighting = true
            cell.accessoryType = confirmedBird.confirmedSighting ? .checkmark : .none
        }
    }
}
