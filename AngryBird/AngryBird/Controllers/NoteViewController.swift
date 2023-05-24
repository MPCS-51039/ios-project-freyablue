//
//  NoteViewController.swift
//  AngryBird
//
//  Created by Yijia chen on 2023/5/24.
//

import UIKit

class NoteViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var noteLabel: UITextView!
    
    public var noteTitle: String = ""
    public var note: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = noteTitle
        noteLabel.text = note
        self.view.backgroundColor = UIColor(red: 254/255, green: 248/255, blue: 221/255, alpha: 1)
        noteLabel.backgroundColor = UIColor(red: 254/255, green: 248/255, blue: 221/255, alpha: 1)

        // Do any additional setup after loading the view.
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


