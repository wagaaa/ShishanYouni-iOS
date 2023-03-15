//
//  TableModels.swift
//  TimeTable
//
//  Created by jerry on 2023/1/21.
//

import Foundation

struct TableModel:Hashable{
    var name: String
    var room: String
    var teacher: String
    var weeklist: [Int]
    var start: Int
    var step: Int
    var day: Int
    var color: Int
}

let sampleTable = [
    TableModel(name: "地质地貌", room: "A302", teacher: "XX", weeklist: [1,2,3,4], start: 3, step: 2,day: 1, color: 0),
    TableModel(name: "土壤学", room: "B230", teacher: "AA", weeklist: [1,2,3,5], start: 5, step: 2,day: 2, color: 1),
    TableModel(name: "植物生理学", room: "B230", teacher: "AA", weeklist: [1,2,3,5], start: 5, step: 2,day: 2, color: 2),
    TableModel(name: "土壤学实验", room: "B230", teacher: "AA", weeklist: [1,3,5], start: 1, step: 4,day: 4, color: 3)
]
