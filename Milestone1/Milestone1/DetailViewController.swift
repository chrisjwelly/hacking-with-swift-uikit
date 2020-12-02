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
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
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
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        
        guard let imageToLoadPath = selectedImagePath else {
            print("No path found")
            return
        }
        
        let imageDesc = Flag.capitalise(flagPath: imageToLoadPath) + " Flag"
        let vc = UIActivityViewController(activityItems: [image, imageDesc], applicationActivities: [])
        
        // Important for iPad
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(vc, animated: true)
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
