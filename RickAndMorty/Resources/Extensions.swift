//
//  Extensions.swift
//  RickAndMorty
//
//  Created by MicroBanker Nepal Pvt. Ltd. on 22/04/2025.
//

import UIKit


extension UIView{
    func addSubViews(_ views: UIView...){
        views.forEach({
            addSubview($0)
        })
    }
}
