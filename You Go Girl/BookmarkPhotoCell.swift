//
//  BookmarkPhotoCell.swift
//  You Go Girl
//
//  Created by Sophia Richter on 12/12/16.
//  Copyright © 2016 Sophia Richter. All rights reserved.
//

import UIKit

class BookmarkPhotoCell: UICollectionViewCell, UICollectionViewDelegate {
    

   //var textLabel: UILabel!
    var imageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height*1))
        //imageView.image = UIImage(named: "Michelle.jpg")
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.sendSubview(toBack: contentView)
        contentView.addSubview(imageView)
       
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
