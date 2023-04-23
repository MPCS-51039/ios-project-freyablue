//
//  DetailViewController.swift
//  AngryBird
//
//  Created by Yijia chen on 2023/4/14.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var whaleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var habitatLabel: UILabel!
    var bird: Bird!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.whaleLabel.text = "Orca"
        self.descriptionLabel.text = "Killer whale"
        self.habitatLabel.text = "From Arctic"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
