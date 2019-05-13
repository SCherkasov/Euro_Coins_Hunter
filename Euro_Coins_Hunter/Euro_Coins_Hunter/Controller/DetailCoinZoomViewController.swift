//
//  DetailCoinZoomViewController.swift
//  Euro_Coins_Hunter
//
//  Created by Stanislav Cherkasov on 3/26/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import UIKit

class DetailCoinZoomViewController: UIViewController {
  
  @IBOutlet var scrollView: UIScrollView!
  @IBOutlet var detailCoinImage: UIImageView!
  
  var detCoiImage = UIImage()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    detailCoinImage.image = detCoiImage
    
    scrollView.delegate = self
    detailCoinImage.frame.size = detailCoinImage.image!.size
    
    detailCoinImage.frame = CGRect(x: 0, y: 0, width: detailCoinImage.frame.width / 2, height: detailCoinImage.frame.height / 2)
    
    detailCoinImage.layer.cornerRadius = detailCoinImage.bounds.size.width / 2
    detailCoinImage.clipsToBounds = true
    
    scrollView.minimumZoomScale = 1.0
    scrollView.maximumZoomScale = 4.0
    scrollView.zoomScale = 1.0
    centeredImage()
  }
  
  func centeredImage() {
    let scrollViewSize = scrollView.bounds.size
    let imageSize = detailCoinImage.frame.size
    
    let horizontalSpace = imageSize.width < scrollViewSize.width
      ? (scrollViewSize.width - imageSize.width) / 2
      : 0
    
    let verticalSpace = imageSize.height < scrollViewSize.height
      ? (scrollViewSize.height - imageSize.height) / 2
      : 0
    
    scrollView.contentInset = UIEdgeInsets(top: verticalSpace,
                                           left: horizontalSpace,
                                           bottom: verticalSpace,
                                           right: horizontalSpace)
  }
}

extension DetailCoinZoomViewController: UIScrollViewDelegate {
  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return detailCoinImage
  }
}
