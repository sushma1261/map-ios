//
//  MultipleCharts.swift
//  mapDemo
//
//  Created by DVNAGARAJU on 23/02/19.
//  Copyright © 2019 SVECW-5. All rights reserved.
//

import UIKit
//import SwiftChart
import Charts


class MultipleCharts: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var collView: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tasks1.count;
    }
    
    var arr = [12.3,4,2,1,1,2,4]
    var days:[String] = ["mon","tue","wed","thu","fri","sat","sun"]
    let tasks:[[Double]] = [[9.0,2.0,3.0,2.0,5.0,6.0,7.0],[19.0,12.0,23.0,12.0,15.0,6.0,17.0]]
    let tasks1:[[Double]] = [[10.0,12.0,13.0,12.0,15.01,16.0,17.0],[0.0,2.0,3.0,2.0,5.01,6.0,1.0]]
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collView.dequeueReusableCell(withReuseIdentifier: "GraphCell1", for: indexPath) as! GraphCollCell
        print("cell")
        cell.barChartView.noDataText = "no data available"
        var dataEntries : [BarChartDataEntry] = []
        var dataEntries1 : [BarChartDataEntry] = []
        var counter = 0.0
        for i in 0..<days.count{
            counter+=1.0
            
            let dataEntry = BarChartDataEntry(x: Double(i), y: tasks[indexPath.item][i] )
            let dataEntry1 = BarChartDataEntry(x: Double(i), y: tasks1[indexPath.item][i] )
            dataEntries.append(dataEntry)
            dataEntries1.append(dataEntry1)
        }
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "raw")
        let chartDataSet1 = BarChartDataSet(values: dataEntries1, label: "treated")
        let chartData :[BarChartDataSet] = [chartDataSet,chartDataSet1]
        chartDataSet.colors = [UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 1)]
        chartDataSet1.colors = [UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: 1)]
        let chart1 = BarChartData(dataSets : chartData)
        
        let groupSpace = 0.3
        let barSpace = 0.05
        let barWidth = 1
        
        let groupCount = days.count
        
        let x = 0
        chart1.barWidth = Double(barWidth)
        cell.barChartView.xAxis.axisMinimum = Double(x)
        
        let gg = chart1.groupWidth(groupSpace: groupSpace, barSpace: barSpace)
        
        cell.barChartView.xAxis.axisMaximum = Double(x)+gg*Double(groupCount)
        
        chart1.groupBars(fromX: Double(x), groupSpace: groupSpace, barSpace: barSpace)
        
        cell.barChartView.notifyDataSetChanged()
        cell.barChartView.data = chart1
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Multiple Charts")
        // Do any additional setup after loading the view.
    }
    
}
