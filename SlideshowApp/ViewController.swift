//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Kazuhiro Sudo on 16/4/5.
//  Copyright © 2016年 k.sudo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageList :Array <UIImage> = []
    var counter = 0
    var isPlaying = false
    
    @IBOutlet var backbutton: UIButton!
    
    @IBOutlet var playstopbutton: UIButton!
    
    @IBOutlet var nextbutton: UIButton!
    

    @IBAction func backAction(sender: AnyObject) {
        if counter == 0 {
            counter = imageList.count - 1
        } else {
            counter--
        }
        imageArea.image = imageList[counter]
        //print("Counter: " + (String)(counter))
    }
    
    
    @IBAction func nextAction(sender: AnyObject) {
        if counter == imageList.count - 1 {
            counter = 0
        } else {
            counter++
        }
        imageArea.image = imageList[counter]
        //print("Counter: " + (String)(counter))
    }
    
    
    @IBAction func playStopAction(sender: AnyObject) {
        
        if isPlaying{//再生中にボタンを押すと停止する
            
            

            playstopbutton.setTitle("再生", forState: .Normal)
            isPlaying = false
        }else{//停止中にボタンを押すと再生が始まる
            
            
            playstopbutton.setTitle("停止", forState: .Normal)
            isPlaying = true
        }
        
    }
    
    
    @IBOutlet var imageArea: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image0:UIImage! = UIImage (named: "0.jpg")
        let image1:UIImage! = UIImage (named: "1.jpg")
        let image2:UIImage! = UIImage (named: "2.jpg")
        let image3:UIImage! = UIImage (named: "3.jpg")
        //let image4:UIImage! = UIImage (named: "4.jpg")

        imageList.append(image0)
        imageList.append(image1)
        imageList.append(image2)
        imageList.append(image3)

        imageArea.image = imageList[0]
        print("Array length: " + (String)(imageList.count))
        
        //imageArea.image = UIImage(named: "images/3.jpg")
        //imageArea.image = UIImage(named: "4.jpg")
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

