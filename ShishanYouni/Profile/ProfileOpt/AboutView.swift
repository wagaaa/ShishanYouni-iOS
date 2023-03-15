//
//  AboutView.swift
//  ShishanYouni
//
//  Created by jerry on 2022/9/27.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationView {
            VStack{
                List{
                    Text("狮山有你是华中农业大学狮山有你工作室开发的一款校园工具类小程序，是碎片化、一站式、一体化的校园移动门户，集课表、成绩、考试、选课推荐、空教室等众多使用功能于一身，是华农校内极具知名度的小程序。\n\n")
                        + Text("iOS版狮山有你由华中农业大学信息学院沸点工作室iOS组开发，致力于为更多同学提供便捷好用的平台。\n\n")
//                            + Text("指导教师：秦丽\n开发成员：赵思博、王昊芮、祝铭煊")
                }
                Text("Copyright ©2022 狮山有你")
                    .font(.caption)
            }
            .navigationTitle("关于")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
