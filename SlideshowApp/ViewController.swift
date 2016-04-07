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
    var interval = 2.0 //再生間隔
    let filenames = ["0.jpg", "1.jpg", "2.jpg", "3.jpg", "4.jpg",]

    var isPlaying = false
    var wasPlayed = false
    var timer = NSTimer()
    
    
    //@IBOutlet var backbutton: UIButton!
    @IBOutlet var backbutton: UIButton!
    @IBOutlet var playstopbutton: UIButton!
    @IBOutlet var nextbutton: UIButton!
    @IBOutlet var imageArea: UIImageView!

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
            stopSlide()
        }else{//停止中にボタンを押すと再生が始まる
            playSlide()
        }
        
    }
    
    func playSlide(){
        timer = NSTimer.scheduledTimerWithTimeInterval(interval, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
        isPlaying = true
        playstopbutton.setTitle("停止", forState: .Normal)
        nextbutton.enabled = false
        backbutton.enabled = false
    }
    
    func stopSlide(){
        timer.invalidate()
        isPlaying = false
        playstopbutton.setTitle("再生", forState: .Normal)
        nextbutton.enabled = true
        backbutton.enabled = true
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageArea.userInteractionEnabled = true
        imageArea.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "imageTapped:"))

        print("# of images: " + (String)(filenames.count))
        
        var i = 0
        while i < filenames.count{
            let imagetmp:UIImage! = UIImage (named: filenames[i])
            imageList.append(imagetmp)
            i++
        }
        imageArea.image = imageList[0]
        
    }
    
    func doAnimation() {
        if counter == imageList.count - 1 {
            counter = 0
        } else {
            counter++
        }
        imageArea.image = imageList[counter]
        print("Filename: " + filenames[counter])
    }
    
    func imageTapped(sender: UITapGestureRecognizer) {
        //print("Filename: " + filenames[counter])
        let targetView: ResultViewController = self.storyboard!.instantiateViewControllerWithIdentifier( "DetailedImage" ) as! ResultViewController
        if isPlaying{
            stopSlide()
            wasPlayed = true
        }
        targetView.passedFilename = filenames[counter]
        targetView.passedImage = imageList [counter]
        self.presentViewController( targetView, animated: true, completion: nil)
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        //initialize when back from the detailed image
        print("Welcome Back!")
        if wasPlayed{
            playSlide()
            wasPlayed = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

