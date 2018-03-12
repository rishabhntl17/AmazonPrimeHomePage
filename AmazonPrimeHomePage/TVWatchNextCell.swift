//
//  TVWatchNextCell.swift
//  AmazonPrimeHomePage
//
//  Created by Appinventiv on 2/27/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class TVWatchNextCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var watchNextCellCollectionView: UICollectionView!
    
    var images1 = ["s1","s2","s3","s4","s4","s5","s6","s7","s8","s9","s10"]
    var images2 = ["1","2","3","4","5","6","7","8"]
    var images3 = ["sp1","sp2","sp3","sp4","sp5","sp6","sp7","sp8","sp9","sp10"]
    var images4 = ["m1","m2","m3","m4","m5","m6","m7","m8","m9","m10"]
    var images5 = ["9","10","11","12","13","14","15","16","17","18"]
    var sec = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        watchNextCellCollectionView.delegate = self
        watchNextCellCollectionView.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item % 3 == 0
        {
            let cellWidth: CGFloat = ((UIScreen.main.bounds.width )/1.5)
            let cellHeight: CGFloat = ((UIScreen.main.bounds.width)/3)
            return CGSize(width: cellWidth,height: cellHeight)
        }
        else
        {
            let cellWidth: CGFloat = ((UIScreen.main.bounds.width )/3)
            let cellHeight: CGFloat = ((UIScreen.main.bounds.width)/3)
            return CGSize(width: cellWidth,height: cellHeight)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if sec == 1
        {
            return images1.count
        }
        else if sec == 2
        {
            return images2.count
        }
        else if sec == 3
        {
            return images3.count
        }
        else if sec == 4
        {
            return images4.count
        }
        else if sec == 5
        {
            return images5.count
        }
        else
        {
            return 0
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = watchNextCellCollectionView.dequeueReusableCell(withReuseIdentifier: "watchnextcvcell", for: indexPath) as! WatchNextCVCell
        if sec == 1
        {
            cell.imageView.image = UIImage(named : (images1[indexPath.item] + ".jpeg"))
        }
        else if sec == 2
        {
            cell.imageView.image = UIImage(named : (images2[indexPath.item] + ".jpeg"))
        }
        else if sec == 3
        {
             cell.imageView.image = UIImage(named : (images3[indexPath.item] + ".jpeg"))
        }
        else if sec == 4
        {
            cell.imageView.image = UIImage(named : (images4[indexPath.item] + ".jpeg"))
        }
        else if sec == 5
        {
            cell.imageView.image = UIImage(named : (images5[indexPath.item] + ".jpeg"))
        }
        return cell
        
    }
}
