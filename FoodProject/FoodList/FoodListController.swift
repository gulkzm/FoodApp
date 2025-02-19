//
//  FoodListController.swift
//  FoodProject
//
//  Created by Gul Kzm on 21.12.24.
//

import UIKit

class FoodListController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    
    let identifier = "\(ProductCell.self)"
    let viewModel = FoodListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureViewModel()
    }
    
    func configureUI() {
    title = "Categories"
        collection.register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
    }
    
    func configureViewModel(){
        viewModel.getFoodData()
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

extension FoodListController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ProductCell
        cell.configure(data: viewModel.items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(FoodItemController.self)") as! FoodItemController
        
        controller.viewModel.category = viewModel.items[indexPath.item]
        navigationController?.show(controller, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width / 2 - 20, height: 200)
    }
}

