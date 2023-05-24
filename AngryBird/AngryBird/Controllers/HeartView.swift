//
//  HeartView.swift
//  AngryBird
//
//  Created by Yijia chen on 2023/5/23.
//

import UIKit

class HeartView: UIViewController {

    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Watch Video", for: .normal)
        
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for:.touchUpInside)

        // Do any additional setup after loading the view.
    }
    
    @objc private func didTapButton() {
        
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
