//
//  WeekTableViewCell.swift
//  ProjectAlfi
//
//  Created by Luis F. Perrone on 4/21/18.
//  Copyright © 2018 ThemFireLabs. All rights reserved.
//

import UIKit
import BFPaperTableViewCell
import ScrollableGraphView

class WeekTableViewCell: BFPaperTableViewCell, ScrollableGraphViewDataSource{
    
    let linePlotData: [Double] = [20.0, 52.0, 13.0, 15.0, 72.0, 20.7, 18.0, 79.0]
    
    let linePlotData2: [Double] = [10.0, 32.0, 73.0, 35.0, 42.0, 23.5, 89.2, 132.83]
    
    func value(forPlot plot: Plot, atIndex pointIndex: Int) -> Double {
        switch(plot.identifier) {
        case "dotPlot1":
            return linePlotData[pointIndex]
        case "dotPlot2":
            return linePlotData2[pointIndex]
        default:
            return 0
        }
    }
    
    func label(atIndex pointIndex: Int) -> String {
        return "Apr"
    }
    
    func numberOfPoints() -> Int {
        return linePlotData.count
    }
    
    @IBOutlet weak var weekLabel: UILabel!
    @IBOutlet weak var monCompletedView: UIView!
    @IBOutlet weak var tueCompletedView: UIView!
    @IBOutlet weak var wedCompletedView: UIView!
    @IBOutlet weak var thurCompletedView: UIView!
    @IBOutlet weak var friCompletedView: UIView!
    @IBOutlet weak var satCompletedView: UIView!
    @IBOutlet weak var sunCompletedView: UIView!
    @IBOutlet weak var daysOfWeekView: UIView!
    
    @IBOutlet weak var graphView: UIView!
    
    var whiteRoundedView = UIView()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        var rec = CGRect(x: 0, y: 0, width: self.graphView.frame.width + 30, height: self.graphView.frame.height + 21)
        let graph = ScrollableGraphView(frame: rec, dataSource: self)
        
        let dotPlot1 = LinePlot(identifier: "dotPlot1")
        dotPlot1.fillColor = UIColor.blue
        dotPlot1.lineColor = UIColorFromRGB(rgbValue: 0xE28241)
        dotPlot1.lineJoin = kCALineCapRound
        dotPlot1.lineCap = kCALineCapRound
        let dotPlot2 = LinePlot(identifier: "dotPlot2")
        dotPlot2.fillColor = UIColor.red
        dotPlot2.lineColor = UIColorFromRGB(rgbValue: 0x239CFF)
        dotPlot2.lineJoin = kCALineCapSquare
        dotPlot2.lineCap = kCALineCapSquare
        // Identifier should be unique for each plot.
        let referenceLines = ReferenceLines()
        
        graph.addPlot(plot: dotPlot1)
        graph.addPlot(plot: dotPlot2)
        graph.topMargin = 0
        graph.leftmostPointPadding = 0
        graph.rightmostPointPadding = 0
    
//        graph.addReferenceLines(referenceLines: referenceLines)
        graph.backgroundFillColor = UIColorFromRGB(rgbValue: 0xfcfcfa)
 

        setupCompletedviews()
        
       
        
        whiteRoundedView = UIView(frame: CGRect(x: 20, y: 8, width:  screenSize.width - 40, height: 165
        ))
        
        whiteRoundedView.layer.backgroundColor = self.UIColorFromRGB(rgbValue: 0xfcfcfa, alpha: 1.0).cgColor
        whiteRoundedView.layer.masksToBounds = false
        
        whiteRoundedView.layer.cornerRadius = 4.0
        
        whiteRoundedView.shadowColor = UIColorFromRGB(rgbValue: 0x313131)
        whiteRoundedView.layer.shadowOpacity = 0.3
        whiteRoundedView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        whiteRoundedView.layer.shadowRadius = 3.0
        
        var rectangle = self.daysOfWeekView.bounds
        rectangle.size.width += 55
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.daysOfWeekView.frame
        rectShape.position = self.daysOfWeekView.center
        rectShape.path = UIBezierPath(roundedRect: rectangle, byRoundingCorners: [.bottomLeft , .bottomRight], cornerRadii: CGSize(width: 6, height: 6)).cgPath
        
        //Here I'm masking the textView's layer with rectShape layer
        self.daysOfWeekView.layer.mask = rectShape
        
//        whiteRoundedView.tag = 1
        
        self.contentView.addSubview(whiteRoundedView)
        self.contentView.sendSubview(toBack: whiteRoundedView)
        
        graphView.addSubview(graph)
        graph.frame.origin.x = 0
        graph.frame.origin.y = 0

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCompletedviews() {
        
        monCompletedView.layer.cornerRadius = monCompletedView.frame.size.width/2
        monCompletedView.clipsToBounds = true
        
        tueCompletedView.layer.cornerRadius = tueCompletedView.frame.size.width/2
        tueCompletedView.clipsToBounds = true
        
        wedCompletedView.layer.cornerRadius = wedCompletedView.frame.size.width/2
        wedCompletedView.clipsToBounds = true
        
        thurCompletedView.layer.cornerRadius = thurCompletedView.frame.size.width/2
        thurCompletedView.clipsToBounds = true
        
        friCompletedView.layer.cornerRadius = friCompletedView.frame.size.width/2
        friCompletedView.clipsToBounds = true
        
        satCompletedView.layer.cornerRadius = satCompletedView.frame.size.width/2
        satCompletedView.clipsToBounds = true
        
        sunCompletedView.layer.cornerRadius = sunCompletedView.frame.size.width/2
        sunCompletedView.clipsToBounds = true
        
    }
    
    func changeWeekName(title: String) {
        weekLabel.text = title
    }
    
    func UIColorFromRGB(rgbValue: UInt, alpha: CGFloat) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func setMonday() {
        monCompletedView.alpha = 1.0
    }
    
    func setTuesday() {
        tueCompletedView.alpha = 1.0
    }
    
    func setWednesday() {
        wedCompletedView.alpha = 1.0
    }
    
    func setThursday() {
        thurCompletedView.alpha = 1.0
    }
    
    func setFriday() {
        friCompletedView.alpha = 1.0
    }
    
    func setSaturday() {
        satCompletedView.alpha = 1.0
    }
    
    func setSunday() {
        sunCompletedView.alpha = 1.0
    }
}
