//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by Kazuhiro Sudo on 16/4/6.
//  Copyright © 2016年 k.sudo. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var detailedFileName: UINavigationItem!
    @IBOutlet var detailedImage: UIImageView!
    
    @IBOutlet var fit: UIBarButtonItem!
    @IBOutlet var fill: UIBarButtonItem!
    var passedFilename: String = ""
    var passedImage: UIImage!

    @IBAction func fitButton(sender: AnyObject) {
        detailedImage.contentMode = UIViewContentMode.ScaleAspectFit
        fill.enabled = true
        fit.enabled = false
    }

    @IBAction func fillButton(sender: AnyObject) {
        detailedImage.contentMode = UIViewContentMode.ScaleAspectFill
        fill.enabled = false
        fit.enabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        detailedImage.image = passedImage
        detailedImage.contentMode = UIViewContentMode.ScaleAspectFill
        fill.enabled = false
        detailedFileName.title = passedFilename
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
