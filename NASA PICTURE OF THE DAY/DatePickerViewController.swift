//
//  DatePickerView.swift
//  NASA PICTURE OF THE DAY
//
//  Created by user on 11/14/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//
import UIKit



class DatePickerViewController: UIViewController {
    @IBOutlet weak var POTDImage: UIImageView!
    
    typealias JSON = [String : String]
    //This function requests the data from URL and gets it in JSON format
    static func getData(with completion: @escaping (JSON) -> ()) {
        let urlString = "https://api.nasa.gov/planetary/apod?api_key=dkuiUVcC47ebbuBmGjicR6NB3QtExjSGtrRSyLu4"
        let url = URL(string: urlString)
        
        guard let unwrappedURL = url else {return}
        
        let session = URLSession.shared
        let task = session.dataTask(with: unwrappedURL) { (data, response, error) in
            print("Start")
            guard let unwrappedData = data else {return}
            
            do {
                let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! JSON
                completion(responseJSON)
                print("Got Data")
                print(responseJSON["hdurl"])
                
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    
   static func downloadImage(at urlString: String, completion: @escaping(Bool, UIImage?) -> ()) {
        
        let url = URL(string: urlString)
    
        guard let unwrappedURL = url else {return}
        
        let request = URLRequest(url: unwrappedURL)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, let image = UIImage(data: data) else { completion(false, nil); return}
            completion(true, image)
        }
        task.resume()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DatePickerViewController.getData { (data) in
            DatePickerViewController.downloadImage(at: data["url"]!, completion: { (success, image) in
                if success == true {
                    print("got image data from URL")
                    DispatchQueue.main.async {
                        self.POTDImage.image = image
                        
                    }
                } else {
                    print ("Error getting image")
                }
  
    })
        }
}

}



