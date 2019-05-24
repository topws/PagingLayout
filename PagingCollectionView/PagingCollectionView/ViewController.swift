//
//  ViewController.swift
//  PagingCollectionView
//
//  Created by Avazu Holding on 2019/5/23.
//  Copyright © 2019 Topws. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		view.addSubview(collectionView)
	}
	
	private lazy var collectionView: UICollectionView = {
		
		let itemSize = CGSize(width: round(UIScreen.main.bounds.width * 0.65), height: round(UIScreen.main.bounds.height * 0.25))
		
		let frame = CGRect(x: 0, y: 100, width: UIScreen.main.bounds.size.width, height: itemSize.height)
		
		let flowlayout = PagingLayout.init()
		flowlayout.scrollDirection = .horizontal
		flowlayout.itemSize = itemSize
		flowlayout.minimumLineSpacing = 30
		
		let insets = UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30)
		let rightInset = UIScreen.main.bounds.width - itemSize.width - insets.left
		flowlayout.sectionInset = UIEdgeInsets(top: 0, left: insets.left, bottom: 0, right: rightInset)
		
		let collectionView = UICollectionView.init(frame: frame, collectionViewLayout: flowlayout)
		collectionView.backgroundColor = UIColor.white
		
		collectionView.register(UINib.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
		collectionView.delegate = self
		collectionView.dataSource = self
		
		return collectionView
		
	}()
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 5
	}
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell: CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
		
		cell.backView.backgroundColor = UIColor.orange
		cell.clipsToBounds = false
		cell.layer.masksToBounds = false
		let layer = cell.layer
		 layer.shadowColor = UIColor.black.cgColor
		 layer.shadowOffset = CGSize(width: 0, height: 5)
		 layer.shadowRadius = 7
		 layer.shadowOpacity = 0.3
		
		layer.shouldRasterize = true
		layer.rasterizationScale = UIScreen.main.scale
		
		return cell
	}
}
