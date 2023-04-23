//
//  BirdService.swift
//  AngryBird
//
//  Created by Yijia chen on 2023/4/6.
//

import Foundation

enum BirdCallingError: Error {
    case problemGeneratingURL
    case problemGettingDataFromAPI
    case problemDecodingData
}
class BirdService{
    //private let urlString = "https://www.mocky.io/v2/5e9d1faf30000022cb0a80e1"
    //my data
    //private let urlString = "https://run.mocky.io/v3/954b7c30-2d7c-422d-a79a-1e1cea238af8"
    //empty list from API
    private let urlString = "https://run.mocky.io/v3/81bb3340-3779-4ead-9e2d-2cafffde0f40"
    //API doesn't work
    
    var hasProblemUrl = false
    
    func getBirds(completion: @escaping ([Bird]?, Error?) -> ()){
        guard let url = URL(string:self.urlString) else{
            DispatchQueue.main.async { completion(nil,
                BirdCallingError.problemGeneratingURL)}
            self.hasProblemUrl = true
            return
        }
        let request = URLRequest(url:url)
        let task = URLSession.shared.dataTask(with: request){ data,
            response, error in
            guard let data = data, error == nil else{
                DispatchQueue.main.async { completion(nil,
                    BirdCallingError.problemGettingDataFromAPI)}
                return
            }
            
            do {
                let birdResult = try
                JSONDecoder().decode(BirdResult.self, from: data)
                DispatchQueue.main.async {
                    completion(birdResult.birds, nil)}
            } catch (let error){
                print(error)
                DispatchQueue.main.async { completion(nil,
                    BirdCallingError.problemDecodingData)}
            }
        }
        task.resume()

    }
//    func getBirds() ->[Bird]{
//        return [
//            Bird(named: "Orca", description: "killer whale",imageURL: "https://i.pinimg.com/originals/60/09/7b/60097bbd49ee025bcb3fec3528aed0b7.jpg"),
//            Bird(named: "Blue Whale", description: "Largest whale",imageURL: "https://i.pinimg.com/originals/35/21/bb/3521bb1e08201bc513258bf3185e321d.jpg"),
//            Bird(named: "Sperm Whale", description: "Largest toothed predator",imageURL: "https://i.pinimg.com/originals/60/b3/3a/60b33a5904a6cfe43349301fcc2c47fc.jpg"),
//            Bird(named: "Gray Whale", description: "A type of baleen whale",imageURL:"https://i.pinimg.com/originals/db/98/2c/db982cb17e8dd96eecd76fddedeec230.jpg"),
//            Bird(named: "Fin Whale", description: "Second largest mammal", imageURL: "https://i.pinimg.com/originals/d8/3b/82/d83b82bab1206eb17cbe93abe1d32969.jpg"),
//
//            Bird(named: "North Atlantic Right Whale", description: "White calluses on its head",imageURL: "https://i.pinimg.com/originals/fd/7d/ff/fd7dffeef140831a2809c779310f8496.jpg"),
//            Bird(named: "Beluga", description: "Arctic White whale",imageURL: "https://i.pinimg.com/originals/7e/36/6e/7e366ec8c1b1746c715017b56c0665ee.jpg"),
//            Bird(named: "Narwhal", description: "Distinguished by a long helical tusk",imageURL: "https://i.pinimg.com/originals/31/93/42/319342fe2eff0265c7de99cb50d518ea.jpg"),
//            Bird(named: "Sei Whale", description: "One of the fastest whales",imageURL: "https://i.pinimg.com/originals/42/d7/0b/42d70b11abf9d76f3f03e77060762d54.jpg"),
////            Bird(named: "Blue Whale", description: "Biggest whale"),
////            Bird(named: "Sperm Whale", description: "Largest toothed predator"),
//        ]
//    }
}
