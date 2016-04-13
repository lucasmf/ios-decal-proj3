//
//  PhotoViewController.swift
//  Photos
//
//  Created by Lucas de Matos Figueredo on 4/12/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    var photo : Photo!
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var displayPhoto: UIImageView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var heart: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        userLabel.text = photo.username
        dateLabel.text = "TODO"
        print(photo.url)
        displayPhoto.image = photo.image
        var x = photo.likes
        if photo.liked == false {
            heart.alpha = 0.3
        }
        else {
            x = x+1
            heart.alpha = 1.0
        }
        likesLabel.text = "  \(x) likes"
        let recognizer = UITapGestureRecognizer(target: self, action: "like")
        heart.userInteractionEnabled = true
        heart.addGestureRecognizer(recognizer)
        var formatter = NSDateFormatter()
        formatter.dateStyle = .ShortStyle
        formatter.timeStyle = .ShortStyle
        dateLabel.text = formatter.stringFromDate(photo.date)
        
        // Do any additional setup after loading the view.
    }

    func like(){
        print("aqui\n")
        if photo.liked == true {
            photo.liked = false
            
        }
        else {
            photo.liked = true
        }
        var x = photo.likes
        if photo.liked == false {
            heart.alpha = 0.3
        }
        else {
            x = x+1
            heart.alpha = 1.0
        }
        likesLabel.text = "  \(x) likes"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
