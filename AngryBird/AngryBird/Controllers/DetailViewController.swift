//
//  DetailViewController.swift
//  AngryBird
//
//  Created by Yijia chen on 2023/4/14.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {

    @IBOutlet weak var whaleImageView: UIImageView!
    @IBOutlet weak var whaleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var map: MKMapView!
    
    @IBOutlet weak var habitatLabel: UILabel!
    var bird: Bird!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.whaleLabel.text = bird.name
        self.descriptionLabel.text = bird.description
        self.habitatLabel.text = "From Arctic"
        // Set initial location in Honolulu
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        //map.centerToLocation(initialLocation)
        
        DispatchQueue.global(qos:
            .userInitiated).async {
                let colorImageData = NSData(contentsOf:
                    URL(string: self.bird!.imageURL)!)
                DispatchQueue.main.async {
                    self.whaleImageView.image = UIImage(data: colorImageData as! Data)
                    self.whaleImageView.layer.cornerRadius = self.whaleImageView.frame.width / 2
                }
                               
            }
                       
    }
    
    // DispatchQueue
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//specify the rectangular region to display to get a correct zoom level.
private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
