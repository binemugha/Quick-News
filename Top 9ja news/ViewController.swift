//
//  ViewController.swift
//  Top 9ja news
//
//  Created by Benjamin Inemugha on 08/05/2021.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var descriptionTxt: UILabel!
    
    var listOfArticles = [Articles]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    //MARK: - TableView Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.deq
        
        return cell
    }
    
    
    //MARK: - Fetching the News
    func fetchNewsData(completionHandler: @escaping (News) -> Void) {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=ng&apiKey=e224765b6f2b4742ad4c0bd10babaf19")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            
            do{
                let newsData = try JSONDecoder().decode(News.self, from: data)
                
                completionHandler(newsData)
            }catch{
                let error = error
                print(error.localizedDescription)
            }

        }.resume()
            
    }


}

