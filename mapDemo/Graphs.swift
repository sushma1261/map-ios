//
//  Graphs.swift
//  mapDemo
//
//  Created by DVNAGARAJU on 23/02/19.
//  Copyright © 2019 SVECW-5. All rights reserved.
//

import UIKit
import Charts
import SwiftChart

class Graphs: UIViewController {
    
    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var lineChart1: LineChartView!
    var arr = [12.3,4,2,1,1,2,4]
    var days:[String] = []
    var ind = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        days = ["mon","tues","wed","thur","fri","sat","sun"]
        let tasks = [9.0,2.0,3.0,2.0,5.0,6.0,7.0]
        let tasks1 = [10.0,12.0,13.0,12.0,15.01,16.0,17.0]
        setChart(dataPoints:days,values:tasks,values1:tasks1)
        
    }
    
    func setChart(dataPoints:[String],values:[Double],values1:[Double]) {
        barChartView.noDataText = "no data available"
        var dataEntries : [BarChartDataEntry] = []
        var dataEntries1 : [BarChartDataEntry] = []
        //var counter = 0.0
        for i in 0..<dataPoints.count{
            //counter+=1.0
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i] )
            let dataEntry1 = BarChartDataEntry(x: Double(i), y: values1[i] )
            //  let dataEntry = BarChartDataEntry(x: Double(i), yValues: [values[i],values1[i]])
            dataEntries.append(dataEntry)
            dataEntries1.append(dataEntry1)
            
            //let d = BarChartDataEntry(x:)
        }
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "raw")
        //        let chartData = BarChartData()
        //        chartData.addDataSet(chartDataSet)
        //        barChartView.data = chartData
        //        chartDataSet.colors = ChartColorTemplates.pastel()
        //
        let chartDataSet1 = BarChartDataSet(values: dataEntries1, label: "treated")
        let chartData :[BarChartDataSet] = [chartDataSet,chartDataSet1]
        chartDataSet.colors = [UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 1)]
        chartDataSet1.colors = [UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: 1)]
        //        chartData1.addDataSet(chartDataSet1)
        //        barChartView.data = chartData1
        //        chartDataSet1.colors = ChartColorTemplates.pastel()
        let chart1 = BarChartData(dataSets : chartData)
        
        let groupSpace = 0.3
        let barSpace = 0.05
        let barWidth = 0.3
        
        let groupCount = dataPoints.count
        
        let x = 0
        
        chart1.barWidth = Double(barWidth)
        barChartView.xAxis.axisMinimum = Double(x)
        
        let gg = chart1.groupWidth(groupSpace: groupSpace, barSpace: barSpace)
        
        barChartView.xAxis.axisMaximum = Double(x)+(gg)*Double(groupCount)
        
        chart1.groupBars(fromX: Double(x), groupSpace: groupSpace, barSpace: barSpace)
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: dataPoints)
        ind = ind + 1
        //  barChartView.xAxis.wordWrapEnabled = true
        barChartView.xAxis.labelPosition =  .bottom
        // barChartView.xAxis.labelWidth = CGFloat(2*barWidth)
        barChartView.xAxis.granularity = 1
        barChartView.notifyDataSetChanged()
        barChartView.data = chart1
        barChartView.animate(xAxisDuration: 3.0, yAxisDuration: 3.0)
    }
    
    
    /*func showChart()  {
        let values = (0..<6).map { (i) -> ChartDataEntry in
            let val = Double(7)
            return ChartDataEntry(x:Double(i), y: val)
            
        }
//        let set1 = LineChartDataSet(values: values, label: "Dataset 1")
//        let data = LineChartData(dataSet: set1)
//        self.lineChart1.data = data
        let set1 = BarChartDataSet(values: values, label: "Dataset 1")
        let data = BarChartData(dataSet: set1)
    lineChart1.noDataText = "no data available"
        
        self.lineChart1.data = data
    }
    */
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
  /*  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
 
}
