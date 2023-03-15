//
//  TableSettingView.swift
//  TimeTable
//
//  Created by jerry on 2023/1/14.
//

import SwiftUI

struct TableSettingView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(.gray)
                .frame(width: 300,height: 400)
        }
    }
}

struct TableSettingView_Previews: PreviewProvider {
    static var previews: some View {
        TableSettingView()
    }
}
