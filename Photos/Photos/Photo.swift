//
//  Photo.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class Photo {
    /* The number of likes the photo has. */
    var likes : Int!
    /* The string of the url to the photo file. */
    var url : String!
    /* The username of the photographer. */
    var username : String!
    
    var date : NSDate!
    
    var HQUrl : String!
    
    var image : UIImage!
    
    var liked : Bool!
    
    /* Parses a NSDictionary and creates a photo object. */
    init (data: NSDictionary) {
        let userDict = data.valueForKey("user") as! NSDictionary
        username = userDict.valueForKey("username") as! String
        let likesDict = data.valueForKey("likes") as! NSDictionary
        likes = likesDict.valueForKey("count") as! Int
        let imagesDict = data.valueForKey("images") as! NSDictionary
        let thumbnail = imagesDict.valueForKey("thumbnail") as! NSDictionary
        url = thumbnail.valueForKey("url") as! String
        let std_reso = imagesDict.valueForKey("standard_resolution") as! NSDictionary
        HQUrl = std_reso.valueForKey("url") as! String
        InstagramAPI.sharedInstance.loadImage(HQUrl) { (image) -> () in
            self.image = image
        }
        let time = data.valueForKey("created_time") as! String
        date = NSDate(timeIntervalSince1970: Double(time)!)
        liked = false
        // FILL ME IN
        // HINT: use nested .valueForKey() calls, and then cast using 'as! TYPE'
    }

}