//
//  MatchTableViewCell.swift
//  FootResultat
//
//  Created by Antoine Frau on 13/11/2019.
//  Copyright © 2019 Antoine Frau. All rights reserved.
//

import UIKit

class MatchTableViewCell: UITableViewCell {
    
    var mainConstraints: [NSLayoutConstraint] = []
    
    let imgDom: UIImageView = {
        let img = UIImageView(image: UIImage(named: "logo_bastia"))
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        return img
    }()
    let imgExt: UIImageView = {
        let img = UIImageView(image: UIImage(named: "logo_ajaccio"))
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        return img
    }()
    let nameDom: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.autoresizingMask = AutoresizingMask.flexibleHeight
        label.font = label.font.withSize(12)
        label.textAlignment = NSTextAlignment.left
        return label
    }()
    
    let nameExt: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.autoresizingMask = AutoresizingMask.flexibleHeight
        label.font = label.font.withSize(12)
        label.textAlignment = NSTextAlignment.right
        return label
    }()
    
    let score: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.autoresizingMask = AutoresizingMask.flexibleHeight
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    let date: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.font = label.font.withSize(9)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        imgDom.translatesAutoresizingMaskIntoConstraints = false
        imgExt.translatesAutoresizingMaskIntoConstraints = false
        nameDom.translatesAutoresizingMaskIntoConstraints = false
        nameExt.translatesAutoresizingMaskIntoConstraints = false
        score.translatesAutoresizingMaskIntoConstraints = false
        date.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(imgDom)
        contentView.addSubview(imgExt)
        contentView.addSubview(nameDom)
        contentView.addSubview(nameExt)
        contentView.addSubview(score)
        contentView.addSubview(date)
        
        let viewsDict = [
            "imgDom": imgDom,
            "imgExt": imgExt,
            "nameDom": nameDom,
            "nameExt": nameExt,
            "score": score,
            "date": date
        ]
       
        let dateConstraintHorizontal = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-[date]|",
            metrics: nil,
            views: viewsDict)
        self.mainConstraints += dateConstraintHorizontal
        
        let horizontalConstraint = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-20-[imgDom(40)]-[nameDom(==nameExt)][score][nameExt]-[imgExt(40)]-20-|",
            metrics: nil,
            views: viewsDict)
        self.mainConstraints += horizontalConstraint
        
        let verticalConstraint = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|[date(20)][imgDom]",
            metrics: nil,
            views: viewsDict)
        self.mainConstraints += verticalConstraint

        let verticalConstraint1 = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[date]-20-[nameDom]",
            metrics: nil,
            views: viewsDict)
        self.mainConstraints += verticalConstraint1

        let verticalConstraint2 = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|[date][imgExt]",
            metrics: nil,
            views: viewsDict)
        self.mainConstraints += verticalConstraint2

        let verticalConstraint3 = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[date]-20-[nameExt]",
            metrics: nil,
            views: viewsDict)
        self.mainConstraints += verticalConstraint3

        let verticalConstraint4 = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[date]-20-[score]",
            metrics: nil,
            views: viewsDict)
        self.mainConstraints += verticalConstraint4
        
        
        NSLayoutConstraint.activate(self.mainConstraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
