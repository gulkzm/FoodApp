//
//  FoodItemController.swift
//  FoodProject
//
//  Created by Gul Kzm on 25.12.24.
//

import UIKit

class FoodItemController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    let identifier = "\(ProductCell.self)"
    let viewModel = FoodItemViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureViewModel()
    }
    
    func configureUI() {
        title = viewModel.category?.foodName
        collection.register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
    }
    
    func configureViewModel(){
        viewModel.configureItemsData()
        viewModel.errorHandler = { errorMessage in
            let alertController = UIAlertController()
            let action = UIAlertAction(title: errorMessage, style: .default)
            alertController.addAction(action)
            self.present(alertController, animated: true)
        }
        viewModel.success = {
            self.collection.reloadData()
        }
    }
}

extension FoodItemController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ProductCell
//        cell.configure(data: viewModel.items[indexPath.item])
        let data = viewModel.items[indexPath.item]
        cell.configure(name: data.itemName ?? "",
                       image: data.itemImage ?? "",
                       isPlusHidden: false)
        cell.plusActionHandler = {
            self.viewModel.addItemToBasket(index: indexPath.item)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width / 2 - 20, height: 200)
    }
}
