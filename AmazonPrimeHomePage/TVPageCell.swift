//
//  TVPageCell.swift
//  AmazonPrimeHomePage
//
//  Created by Appinventiv on 2/27/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class TVPageCell: UITableViewCell, UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var pageCellCollectionView: UICollectionView!
    
    var pageController : UIPageControl!
    var images = ["1","2","3","4","5","6","7"]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pageCellCollectionView.delegate = self
        pageCellCollectionView.dataSource = self
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(AutoScroll(_:)), userInfo: nil, repeats: true)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageController.currentPage = indexPath.item
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth: CGFloat = ((UIScreen.main.bounds.width))
        let cellHeight: CGFloat = ((UIScreen.main.bounds.width)/1.5)
        return CGSize(width: cellWidth,height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = pageCellCollectionView.dequeueReusableCell(withReuseIdentifier: "pagecvcell", for: indexPath) as! PageCVCell
        cell.imageView.image = UIImage(named : (images[indexPath.item]))
        pageController = cell.pageControl
        pageController.numberOfPages = images.count
        pageController.addTarget(self, action: #selector(pageChange), for: .valueChanged)
        pageController.currentPageIndicatorTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        pageController.pageIndicatorTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return cell
    }
    
    
    @objc func pageChange() {
        let pageNumber = pageController.currentPage
        var frame = pageCellCollectionView.frame
        frame.origin.x = frame.size.width * CGFloat(pageNumber)
        frame.origin.y = 0
        pageCellCollectionView.scrollRectToVisible(frame, animated: true)
    }
    
    @objc func AutoScroll(_ timer1: Timer)
    {
        if let collection = pageCellCollectionView
        {
            for cell in collection.visibleCells
            {
                let indexPath = collection.indexPath(for: cell)
                if((indexPath?.row)! < images.count - 1)
                {
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: (indexPath?.row)! + 1, section: (indexPath?.section)!)
                    collection.scrollToItem(at: indexPath1!, at: .right, animated: true)
                    
                }
                else
                {
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: 0, section: (indexPath?.section)!)
                    collection.scrollToItem(at: indexPath1!, at: .left, animated: true)
                    
                }
            }
        }
    }
}

