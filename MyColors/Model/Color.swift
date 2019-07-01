//
//  Color.swift
//  MyColors
//
//  Created by Matt Deuschle on 6/30/19.
//  Copyright © 2019 Matt Deuschle. All rights reserved.
//

import UIKit

struct Color: Decodable {
    let title: String?
    let rank: Int?
    let rgb: RGB?
    
    struct RGB: Decodable {
        let red: CGFloat?
        let green: CGFloat?
        let blue: CGFloat?
        
        var color: UIColor {
            return UIColor(red: (red ?? 0)/255,
                           green: (green ?? 0)/255,
                           blue: (blue ?? 0)/255,
                           alpha: 1.0)
        }
    }
}
