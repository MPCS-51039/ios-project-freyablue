//
//  EntryViewController.swift
//  AngryBird
//
//  Created by Yijia chen on 2023/5/24.
//

import UIKit

class EntryViewController: UIViewController {

    @IBOutlet var titleField: UITextField!
    @IBOutlet var noteField: UITextView!
    
    public var completion: ((String,String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.becomeFirstResponder()
        titleField.backgroundColor = UIColor(red: 255/255, green: 237/255, blue: 244/255, alpha: 1)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        // Do any additional setup after loading the view.
    }
    
    @objc func didTapSave(){
        if let text = titleField.text,!text.isEmpty, !noteField.text.isEmpty {
            completion?(text, noteField.text)
        }
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
