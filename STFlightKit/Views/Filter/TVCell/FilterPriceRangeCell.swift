//
//  FilterPriceRangeCell.swift
//  ShareTrip
//
//  Created by Sharetrip-iOS on 12/3/19.
//  Copyright © 2019 TBBD IOS. All rights reserved.
//

import UIKit
import STCoreKit

class FilterPriceRangeCell: UITableViewCell {
    
    weak var delegate: PriceRangeCellDelegate?
    
    @IBOutlet weak var minPriceLabel: UILabel!
    @IBOutlet weak var maxPriceLabel: UILabel!
    @IBOutlet weak var rangeSeekSlider: RangeSeekSlider!
    @IBOutlet weak var cellContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }
    
    func setupView(){

        rangeSeekSlider.delegate = self
        selectionStyle = .none
        cellContainerView.layer.cornerRadius = 4.0
        
        let panGesture = UIPanGestureRecognizer(target: nil, action:nil)
        panGesture.cancelsTouchesInView = false
        rangeSeekSlider.addGestureRecognizer(panGesture)
    }
    
    func configure(priceRange: FilterPriceRange, delegate: PriceRangeCellDelegate){

        self.delegate = delegate
        
        let currentLow = priceRange.currentLow ?? priceRange.low
        let currentHigh = priceRange.currentHigh ?? priceRange.high
        
        minPriceLabel.text = currentLow.withCommas()
        maxPriceLabel.text = currentHigh.withCommas()
        
        rangeSeekSlider.minValue = 1
        rangeSeekSlider.maxValue = 1
        
        rangeSeekSlider.minValue = CGFloat(priceRange.low)
        rangeSeekSlider.maxValue = CGFloat(priceRange.high)
        rangeSeekSlider.selectedMinValue = CGFloat(currentLow)
        rangeSeekSlider.selectedMaxValue = CGFloat(currentHigh)
        //rangeSeekSlider.setNeedsDisplay()
    }
    
}

// MARK: - RangeSeekSliderDelegate

extension FilterPriceRangeCell: RangeSeekSliderDelegate {
    
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
        minPriceLabel.text = Int(minValue).withCommas()
        maxPriceLabel.text = Int(maxValue).withCommas()
        delegate?.rangeSeekSliderDidChange(minValue: minValue, maxValue: maxValue)
    }
}

