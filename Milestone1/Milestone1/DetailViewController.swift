//
//  DetailViewController.swift
//  Milestone1
//
//  Created by Christian James Welly on 2/12/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet var imageView: UIImageView!
    var selectedImagePath: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageToLoad = selectedImagePath {
            imageView.image = UIImage(named: imageToLoad)
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
