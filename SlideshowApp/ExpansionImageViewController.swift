//
//  ExpansionImageViewController.swift
//  SlideshowApp
//
//  Created by 小野寺祥吾 on 2020/01/02.
//  Copyright © 2020 syogo-user. All rights reserved.
//

import UIKit

class ExpansionImageViewController: UIViewController {
    
    
    @IBOutlet weak var expansionImage: UIImageView!
    var selectedImage : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expansionImage.image = selectedImage
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
