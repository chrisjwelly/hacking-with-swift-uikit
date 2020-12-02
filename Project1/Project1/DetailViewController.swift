//
//  DetailViewController.swift
//  Project1
//
//  Created by Christian James Welly on 1/12/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var pictureNo: Int?
    var totalPictures: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let unwrappedOrder = pictureNo, let totalCount = totalPictures {
            title = "Picture \(unwrappedOrder) of \(totalCount)"
        }
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
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
