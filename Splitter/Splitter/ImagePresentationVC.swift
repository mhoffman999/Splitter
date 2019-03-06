//
//  ImagePresentationVC.swift
//  Splitter
//
//  Created by Michael Hoffman on 3/4/19.
//  Copyright © 2019 Here We Go. All rights reserved.
//

import UIKit

class ImagePresentationVC: UIViewController {


//    //Don't need label or the func for adding text to it
//    @IBOutlet weak var detailDescriptionLabel: UILabel!
//
// //**** NOTE: Because "detailItem" is not being used,
// //AppDelegate func splitViewController must be updated with the name the new variable
//    //In this case... image
//    func configureView() {
//        // Update the user interface for the detail item.
//        if let detail = detailItem {
//            if let label = detailDescriptionLabel {
//                label.text = detail.description
//            }
//        }
//    }


    @IBOutlet weak var itemImageView: UIImageView!
    
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //configureView()
        
        itemImageView.image = image
        
    }


//    var detailItem: NSDate? {
//        didSet {
//            // Update the view.
//            configureView()
//        }
//    }


 }

