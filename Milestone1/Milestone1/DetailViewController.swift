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
        
        navigationItem.largeTitleDisplayMode = .never
        
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        
        if let imageToLoadPath = selectedImagePath {
            // The path is currently hardcoded with either 2x or 3x
            // Get lowercase flag so that we can determine resolution during runtime
            let imageToLoad = Flag.getLowercaseFlag(flagPath: imageToLoadPath)
            title = Flag.capitalise(lowercaseFlag: imageToLoad)
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
