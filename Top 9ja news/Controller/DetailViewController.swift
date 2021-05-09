//
//  DetailViewController.swift
//  Top 9ja news
//
//  Created by Benjamin Inemugha on 08/05/2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    var imageViewR: UIImage!
    var textViewR: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func readMore(_ sender: Any) {
        print("Read more button pressed")
    }
    
}
