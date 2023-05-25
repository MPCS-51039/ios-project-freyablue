//
//  HeartView.swift
//  AngryBird
//
//  Created by Yijia chen on 2023/5/23.
//

import UIKit

class HeartView: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var videoButton: UIButton!
    
    //    private let button: UIButton = {
//        let button = UIButton()
//        button.setTitle("Watch Video", for: .normal)
//
//        return button
//    }()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for:.touchUpInside)
        
        self.view.addSubview(videoButton)
        videoButton.addTarget(self, action: #selector(didTapVideoButton), for:.touchUpInside)
        self.view.backgroundColor = UIColor(red: 240.0/255.0, green: 248.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        
        

        
        

        // Do any additional setup after loading the view.
    }
    
    @objc private func didTapButton() {
        guard let url = URL(string: "https://whale.org/whale-conservation/") else {
            return
        }
        let vc = WebViewController(url: url, title: "Learn More")
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
    }
    
    @objc private func didTapVideoButton() {
        guard let url = URL(string: "https://www.youtube.com/whalesorg") else {
            return
        }
        let vc = WebViewController(url: url, title: "Watch Videos")
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
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
