//
//  ViewController.swift
//  AngryBird
//
//  Created by Yijia chen on 2023/3/31.
//

import UIKit

class BirdListViewController: UIViewController{
    
    

    
    @IBOutlet weak var tableView: UITableView!
    
    var flock:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.flock = ["redBird", "blueBird","blackBird"]
        
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
        cell.birdNameLabel.text = self.flock[indexPath.row]
        cell.birdDescriptionLabel.text = "set value"
        return cell
    }
    
}

extension BirdListViewController: UITableViewDelegate {
    //MARK: Delegate
    
    
}
