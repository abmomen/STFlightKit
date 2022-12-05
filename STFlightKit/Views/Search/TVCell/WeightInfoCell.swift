//
//  WeightInfoCell.swift
//  TBBD
//
//  Created by Mac on 4/18/19.
//  Copyright © 2019 TBBD IOS. All rights reserved.
//

import UIKit

class WeightInfoCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        tintColor = .black
        textLabel?.textAlignment = .left
        imageView?.image = UIImage(named: "weight-mono")
        textLabel?.textColor = .black
        contentView.backgroundColor = .white
        textLabel?.backgroundColor = .clear
    }
    
    func configure(history: FlightBookingHistory){
        var weightText = "Info isn't available"
        if let baggageInfo = history.baggageInfo?.first {
            if let adultWeight = baggageInfo.adult, adultWeight.count > 0 {
                weightText = "Adult: \(adultWeight)"
            }
            if let childWeight = baggageInfo.child, childWeight.count > 0 {
                weightText.append("; Child: \(childWeight)")
            }
            if let infantWeight = baggageInfo.infant, infantWeight.count > 0{
                weightText.append("; Infant: \(infantWeight)")
            }
        } else if let firstSegment = history.segments.first, let firstSegmentDetail = firstSegment.segmentDetails.first {
            
            var adult = 0
            var child = 0
            var infant = 0
            
            for traveller in history.travellers {
                if let travellerType = traveller.travellerType {
                    switch travellerType {
                    case .adult:
                        adult += 1
                    case .child:
                        child += 1
                    case .infant:
                        infant += 1
                    }
                }
            }
            
            weightText = "\(firstSegmentDetail.baggageWeight) \(firstSegmentDetail.baggageUnit) * \(adult)"
        }
        
        textLabel?.text = weightText
    }
}


