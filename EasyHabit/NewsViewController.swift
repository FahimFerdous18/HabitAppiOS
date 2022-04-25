//
//  NewsViewController.swift
//  EasyHabit
//
//  Created by BJIT on 1/26/22.
//

import UIKit
import AlamofireImage

class NewsViewController: UIViewController {
    
    var articles = [Article]()
    

    @IBOutlet weak var newstabView: UITableView!
    @IBOutlet weak var newscolView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
        self.newstabView.delegate = self
        self.newstabView.dataSource = self
        self.newstabView.layer.cornerRadius = 15.0
        let nibName = UINib(nibName: "NewsTableViewCell", bundle: nil)
        newstabView.register(nibName, forCellReuseIdentifier: "newstabCell")
        
        self.newscolView.delegate = self
        self.newscolView.dataSource = self
        self.newscolView.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "newscolView")
        newstabView.layer.cornerRadius = 20

        // Do any additional setup after loading the view.
    }
    
    @IBAction func filter(_ sender: Any)
    {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewsFilterViewController") as! NewsFilterViewController
                self.addChild(popOverVC)
                        popOverVC.view.frame = self.view.frame
                        self.view.addSubview(popOverVC.view)
                popOverVC.didMove(toParent: self)
    }
    


}
extension NewsViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celln = tableView.dequeueReusableCell(withIdentifier: "newstabCell", for: indexPath) as! NewsTableViewCell
        
        let downloader = ImageDownloader()
        let urlRequest = URLRequest(url: URL(string: articles[indexPath.row].proimg)!)

        downloader.download(urlRequest) { response in
            print(response.request)
            print(response.response)
            debugPrint(response.result)

            if case .success(let image) = response.result {
                celln.proimg.image = image
            }
        }
        celln.headl.text = articles[indexPath.row].headl
        celln.datee.text = articles[indexPath.row].datee
        celln.name.text = articles[indexPath.row].name
        return celln
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
            {
                self.performSegue(withIdentifier: "editNote", sender: self)
            }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as?
            DeatilsNewsViewController {
            //destination.fullDetail = Details.detail[(tableView.indexPathForSelectedRow?.row)!]
            destination.FullNews = articles[(newstabView.indexPathForSelectedRow?.row ?? 0)].description
            destination.daate = articles[(newstabView.indexPathForSelectedRow?.row ?? 0)].datee
            destination.titlee = articles[(newstabView.indexPathForSelectedRow?.row ?? 0)].headl
            destination.imgg = articles[(newstabView.indexPathForSelectedRow?.row ?? 0)].proimg
            
            //destination.imgg = UIImage(named: articles[(newstabView.indexPathForSelectedRow?.row ?? 0)].proimg)


        }
    }
    }
    
    

extension NewsViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newscolView", for: indexPath) as! NewsCollectionViewCell
        cell.layer.cornerRadius = 10
        
        let downloader = ImageDownloader()
        let urlRequest = URLRequest(url: URL(string: articles[indexPath.row].proimg)!)

        downloader.download(urlRequest) { response in
            //print(response.request)
            //print(response.response)
            debugPrint(response.result)

            if case .success(let image) = response.result {
                cell.coverimg.image = image
            }
        }
        
        cell.headline.text = articles[indexPath.row].headl
        cell.author.text = articles[indexPath.row].name
        return cell
    }
    
    
}
extension NewsViewController {
    func getData()
    {
        let urlString = String(format: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=b32cc6786108468b95ebf9b9ad748bd6")
        print("url string is \(urlString)")
        
        guard let url = URL(string: String(format: "%@", urlString)) else{
            print("url not valid")
            return
        }
        //header section config
        var request : URLRequest = URLRequest(url: url)
        
        //request.httpMethod = "GET"
        //request.timeoutInterval = 30
        
        //establish connection backend service
        
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
                                
                        //self.infolist.append(Info(name: item["name"] as? String ?? ""))
                        }
                        print("found")
                            DispatchQueue.main.async {
                                self.newstabView.reloadData()
                                self.newscolView.reloadData()
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
