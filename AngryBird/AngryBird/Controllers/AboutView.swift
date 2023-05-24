//
//  AboutView.swift
//  AngryBird
//
//  Created by Yijia chen on 2023/5/23.
//

import UIKit

class AboutView: UIViewController {
    

    @IBOutlet weak var bg: UIImageView!
    
    @IBOutlet weak var myText: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bg.loadGif(name: "whale")
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
