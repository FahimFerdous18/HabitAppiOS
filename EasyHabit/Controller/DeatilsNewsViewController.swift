//
//  DeatilsNewsViewController.swift
//  EasyHabit
//
//  Created by BJIT on 1/26/22.
//

import UIKit
import AlamofireImage

class DeatilsNewsViewController: UIViewController {
    var index : Int = 0
    var articles = [Article]()

    @IBOutlet weak var headlinee: UILabel!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var details: UITextView!
    
    var FullNews : String?
   
    var titlee : String?
    var imagee : UIImage?
    var daate : String?
    var imgg : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()

        
        details.text = FullNews
        day.text = daate
        headlinee.text = titlee
        
        
        //Create URL
        let url = URL(string: imgg!)!

            // Fetch Image Data
            if let data = try? Data(contentsOf: url) {
            // Create Image and Update Image View
            img.image = UIImage(data: data)
            }

    }
    
    @IBAction func back(_ sender: Any)
    {
    }
    

}
extension DeatilsNewsViewController {
    func getData()
    {
        let urlString = String(format: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=b32cc6786108468b95ebf9b9ad748bd6")
        print("url string is \(urlString)")
        
        guard let url = URL(string: String(format: "%@", urlString)) else{
            print("url not valid")
            return
        }
       
        var request : URLRequest = URLRequest(url: url)
       
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        let dataTask = session.dataTask(with: request) {
            data, responseHeaderSection, error in
            guard let httpResponse = responseHeaderSection as? HTTPURLResponse, let response = data
            else {
                print("error: not a valid http req")
                return
            }
            switch (httpResponse.statusCode)
            {
            case 200:
                do {
                    let getResponse = try JSONSerialization.jsonObject(with: response, options: .allowFragments)
                    print(getResponse)
                    
                    if let response = getResponse as? [String:Any] {
                        print(response["totalResults"])
                        if let articles = response["articles"] as? [AnyObject]{
                            for item in articles {
                                print("Headline article")
                            
                                self.articles.append(Article(headl: item["title"] as? String ?? "", name: item["author"] as? String ?? "",description: item["description"] as? String ?? "", datee: item["publishedAt"] as? String ?? "",proimg: item["urlToImage"] as? String ?? ""))
                                
                      
                        }
                        print("found")
                            DispatchQueue.main.async {
                               
                            }
                            
                        }
                    
                    
                }else if let response = getResponse as? [String:AnyObject] {
                    
                }
                
            } catch {
                print("error serializing JSON \(error)")
            }
            break
            case 400:
                do {
                    let getResponse = try JSONSerialization.jsonObject(with: response, options: .allowFragments)
                    print(getResponse)
                    if let response = getResponse as? [String:Any] {
                        print(response["error_message"] ?? "")
                    }
                    
                } catch {
                    print("error JSON : \(error)")
                }
                break
            default:
                print("wallet GET req get response \(httpResponse.statusCode)")
            
        }
    }
        dataTask.resume()
    }
}
