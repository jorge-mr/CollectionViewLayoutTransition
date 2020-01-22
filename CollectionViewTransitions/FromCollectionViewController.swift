//
//  ViewController.swift
//  CollectionViewTransitions
//
//  Created by Jorge MR on 21/01/20.
//  Copyright © 2020 Jorge MR. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SquareCollectionViewController: UICollectionViewController {
    
    var colors: [[UIColor]] = [[.blue,.blue,.blue,.blue,.blue,.blue,.blue,.blue,.blue,.blue,.blue,.blue,.blue],[.green,.green,.green,.green,.green],[.purple,.purple,.purple,.purple,.purple,.purple,.purple,.purple,.purple,.purple,.purple,.purple,.purple,.purple,.purple,.purple,.purple,.purple,.purple,.purple,.purple]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return colors.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors[section].count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = colors[indexPath.section][indexPath.item]
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
        let bigVC = sb.instantiateViewController(identifier: "BigCVC") as! BigCVC
        bigVC.colors = colors
        navigationController?.pushViewController(bigVC, animated: true)
    }
}

class BigCVC: SquareCollectionViewController {
    
    required init?(coder: NSCoder) {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        super.init(collectionViewLayout: layout)
        useLayoutToLayoutNavigationTransitions = true
        colors = [[.blue,.blue,.blue,.blue,.blue,.blue,.blue,.blue,.blue,.blue,.blue,.blue,.blue],[.green,.green,.green,.green,.green],[.purple,.purple,.purple,.purple,.purple,.purple,.purple,.purple,.purple,.purple,.purple,.purple,.purple,.purple,.purple,.purple,.purple,.purple,.purple,.purple,.purple]]
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.popViewController(animated: true)
    }
}
