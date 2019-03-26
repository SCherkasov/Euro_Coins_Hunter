//
//  DetailCoinZoomViewController.swift
//  Euro_Coins_Hunter
//
//  Created by Stanislav Cherkasov on 3/26/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import UIKit

class DetailCoinZoomViewController: UIViewController, UIScrollViewDelegate {
  
  @IBOutlet var scrollView: UIScrollView!
  @IBOutlet var detailCoinImage: UIImageView!
  
  var detCoiImage = UIImage()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    detailCoinImage.image = detCoiImage
    
    detailCoinImage.layer.cornerRadius = detailCoinImage.bounds.size.width / 2
    detailCoinImage.clipsToBounds = true
    
    scrollView.delegate = self
    scrollView.minimumZoomScale = 1.0
    scrollView.maximumZoomScale = 4.0
    scrollView.zoomScale = 1.0
  }
  
  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return detailCoinImage
  }
}
