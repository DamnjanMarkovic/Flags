//
//  DetailsViewController.swift
//  Consolidation2
//
//  Created by Damnjan Markovic on 23/07/2020.
//  Copyright © 2020 Damnjan Markovic. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet var imageVIew: UIImageView!
    var countryName: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageVIew.layer.borderWidth = 1
        imageVIew.layer.borderColor = UIColor.lightGray.cgColor
        imageVIew.image = UIImage(named: countryName!)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

    }
    
    @objc func shareTapped() {
        guard let countryFlagImage = imageVIew.image?.jpegData(compressionQuality: 1.0) else {
            return
        }
        let vc = UIActivityViewController(activityItems: [countryFlagImage, countryName!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true, completion: nil)
        
    }
    


}
