//
//  ViewController.swift
//  Top 9ja news
//
//  Created by Benjamin Inemugha on 08/05/2021.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var parser = Parser()
    var listOfArticles = [Articles]()

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        parser.fetchNewsData { (data) in
            self.listOfArticles = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
    
    }
    @objc private func didPullToRefresh(){
        
        parser.fetchNewsData { (data) in
            self.listOfArticles = data
            DispatchQueue.main.async {
                //self.listOfArticles.removeAll()
                self.tableView.refreshControl?.endRefreshing()
                self.tableView.reloadData()
            }
        }
        
    }
    
    
    //MARK: - TableView Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsTableViewCell
        let news = listOfArticles[indexPath.row]

        cell.titleTxt.text = news.title

        let isoDate = news.publishedAt
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MM-dd-yyy HH:mm"

        if let date = dateFormatterGet.date(from: isoDate!) {
            cell.dataTxt.text = dateFormatterPrint.string(from: date)
        } else {
            cell.dataTxt.text = "There was an error with the time"
        }
         
        return cell
    }
    
    //Move the next detailed view controller
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        performSegue(withIdentifier: "next", sender: self)
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
//        navigationController?.pushViewController(vc, animated: true);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "next"{
            let vc = segue.destination as! DetailViewController
            vc.details = listOfArticles[(tableView.indexPathForSelectedRow?.row)!]
            
        }
    }
    
    
    
}

