//
//  ProductCell.swift
//  FoodProject
//
//  Created by Gul Kzm on 24.12.24.
//

import UIKit

class ProductCell: UICollectionViewCell {
    @IBOutlet private weak var productImage: UIImageView!
    @IBOutlet private weak var plusImage: UIImageView!
    @IBOutlet private weak var productNameLabel: UILabel!
    
    var plusActionHandler: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(plusImageAction))
//        plusImage.isUserInteractionEnabled = true
        plusImage.addGestureRecognizer(tapGesture)
    }
    
    func configure(data: FoodModel) {
        plusImage.isHidden = true
        productNameLabel.text = data.foodName
        productImage.image = .init(named: data.foodImage ?? "")
    }
    
    func configure(data: FoodItem) {
        plusImage.isHidden = false
        productNameLabel.text = data.itemName
        productImage.image = .init(named: data.itemImage ?? "")
    }
    
    func configure(name:String, 
                   image: String,
                   isPlusHidden: Bool = true) {
        plusImage.isHidden = isPlusHidden
        productNameLabel.text = name
        productImage.image = .init(named: image)
    }
    
    @objc func plusImageAction(){
        plusActionHandler?()
    }
}


