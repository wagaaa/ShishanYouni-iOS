//
//  ContentView.swift
//  TimeTable
//
//  Created by jerry on 2023/1/13.
//

import SwiftUI

struct TimetableView: View {
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                VStack {
                    WeekBarView(index: 0)
                        .padding(.horizontal)
                        .background(.ultraThinMaterial)
                    ScrollView(showsIndicators: false) {
                        HStack {
                            TimeBarView()
                            TableView()
                        }
                    }//.padding(.horizontal,8)
                }
                .navigationTitle("课表")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Menu {
                        Button("导入课表", action: {})
                        Button("导入实验", action: {})
                    } label: {
                        Label("", systemImage: "ellipsis.circle")
                    }
                }
            }
        } else {
            // Fallback on earlier versions
        }

    }
}

struct TimetableView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeekBarView: View {
    @State var index: Int
    var body: some View {
        let weeks = ["第一周", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期天"]
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem(), GridItem(), GridItem(), GridItem(), GridItem(), GridItem()]) {
            ForEach(weeks, id: \.self) { Day in
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.blue)
                        .frame(width: 40, height: 45)
                    VStack {
                        Text("\(Day)")
                        Text("2-13")
                    }
                        .font(.caption)
                }
            }
        }
    }
}

//struct CardView: View {
//    var body: some View {
//
//    }
//}

struct TimeBarView: View {
    var body: some View {
        let nums = (1...12)
        VStack {
            ForEach(nums, id: \.self) { num in
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.blue)
                        .frame(width: 40, height: 55)
                    VStack {
                        Text("\(num)")
                        Text("8:00")
                        Text("8:45")
                    }
                        .font(.caption)
                }
            }
        }
    }
}

struct TableView: View {
    @State var heightofRec: CGFloat?
    var body: some View {
        LazyHGrid(rows: [GridItem(), GridItem(), GridItem(), GridItem(), GridItem(), GridItem()]) {
            ForEach(sampleClassList, id: \.self) { singleClass in
                if singleClass.name == "" {
                    Text("")
                        .frame(width: 40)
                } else {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.gray)
                            .frame(width: 40, height: heightofRec)
                        VStack {
                            Text("\(singleClass.name)")
                            Text("C302")
                                .font(.caption)
                            Text("XXX")
                                .font(.caption)
                        }
                        .frame(width: 40)
                    }
                }
            }
        }
    }
}

func checkWeek(_ startdate : String) -> Int {
  
  let formatter = DateFormatter()
  let calendar = Calendar.current
  formatter.dateFormat = "yyyy-MM-dd"

  // 当天
  let today = Date()
  let toDay = formatter.date(from: formatter.string(from: today))
  
  // 开学日期
  let startDate = formatter.date(from: startdate)
  
  let diff:DateComponents = calendar.dateComponents([.day], from: startDate!, to: toDay!)
  return diff.day!/7 + 1
}





func generateWeekCard(Tables: [TableModel]) {

}

let sampleClassList = [
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 1, step: 0, day: 1, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 3, step: 0, day: 1, color: 0),
    TableModel(name: "Class", room: "", teacher: "", weeklist: [], start: 5, step: 2, day: 1, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 7, step: 0, day: 1, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 9, step: 0, day: 1, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 11, step: 0, day: 1, color: 0),
    
    TableModel(name: "Class", room: "", teacher: "", weeklist: [], start: 1, step: 0, day: 2, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 3, step: 0, day: 2, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 5, step: 2, day: 2, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 7, step: 0, day: 2, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 9, step: 0, day: 2, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 11, step: 0, day: 2, color: 0),
    
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 1, step: 0, day: 3, color: 0),
    TableModel(name: "Class", room: "", teacher: "", weeklist: [], start: 3, step: 0, day: 3, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 5, step: 2, day: 3, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 7, step: 0, day: 3, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 9, step: 0, day: 3, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 11, step: 0, day: 3, color: 0),
    
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 1, step: 0, day: 4, color: 0),
    TableModel(name: "Class", room: "", teacher: "", weeklist: [], start: 3, step: 0, day: 4, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 5, step: 4, day: 4, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 7, step: 0, day: 4, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 9, step: 0, day: 4, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 11, step: 0, day: 4, color: 0),
    
    TableModel(name: "Class", room: "", teacher: "", weeklist: [], start: 1, step: 0, day: 5, color: 0),
    TableModel(name: "Class", room: "", teacher: "", weeklist: [], start: 3, step: 0, day: 5, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 5, step: 2, day: 5, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 7, step: 0, day: 5, color: 0),
    TableModel(name: "Class", room: "", teacher: "", weeklist: [], start: 9, step: 0, day: 5, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 11, step: 0, day: 5, color: 0),
    
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 1, step: 0, day: 6, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 3, step: 0, day: 6, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 5, step: 2, day: 6, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 7, step: 0, day: 6, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 9, step: 0, day: 6, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 11, step: 0, day: 6, color: 0),
    
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 1, step: 0, day: 7, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 3, step: 0, day: 7, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 5, step: 2, day: 7, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 7, step: 0, day: 7, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 9, step: 0, day: 7, color: 0),
    TableModel(name: "", room: "", teacher: "", weeklist: [], start: 11, step: 0, day: 7, color: 0)
]

let colorSet = [Color.blue]
