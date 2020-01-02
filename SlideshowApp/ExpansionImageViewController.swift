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
        expansionImage.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        // Do any additional setup after loading the view.

    }
    
//    @IBAction func big(_ sender: Any) {
//        let width :CGFloat = selectedImage.size.width
//        let height :CGFloat = selectedImage.size.height
//        let rect: CGRect = CGRect(x:0,y:0,width:1000,height:1000)
//        expansionImage.frame = rect;
//        expansionImage.center = CGPoint(x:800,y:800)
//        self.view.addSubview(expansionImage)
//    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
