//
//  DetailViewController.swift
//  Top 9ja news
//
//  Created by Benjamin Inemugha on 08/05/2021.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var labelTxt: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var details: Articles?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //imageView.image = details?.urlToImage
        guard let url = URL(string: (details?.url)!) else{
            print("An error occured with the website")
            return
        }
        spinner.startAnimating()
        webView.load(URLRequest(url: url))
        spinner.stopAnimating()
    }
    

    @IBAction func readMore(_ sender: Any) {
        print("Read more button pressed")
    }
    
}
