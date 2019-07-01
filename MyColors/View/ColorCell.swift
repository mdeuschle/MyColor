//
//  ColorCell.swift
//  MyColors
//
//  Created by Matt Deuschle on 6/30/19.
//  Copyright © 2019 Matt Deuschle. All rights reserved.
//

import UIKit

class ColorCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: "ColorCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure(with color: Color) {
        self.textLabel?.text = color.title
        self.detailTextLabel?.text = "\(color.rank ?? 0)"
        self.backgroundColor = color.rgb?.color
    }
}
