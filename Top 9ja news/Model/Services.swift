//
//  Services.swift
//  Top 9ja news
//
//  Created by Benjamin Inemugha on 08/05/2021.
//

import Foundation

struct Parser{
    func fetchNewsData(completionHandler: @escaping ([Articles]) -> Void) {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=ng&apiKey=e224765b6f2b4742ad4c0bd10babaf19")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            
            do{
                let newsData = try JSONDecoder().decode(News.self, from: data)
                let articles = newsData.articles
                print("Success")
                //print(newsData.totalResults!)
                completionHandler(articles)
            }catch{
                let error = error
                print(error.localizedDescription)
            }

        }.resume()
            
    }

}

