//
//  ShareView.swift
//  ShishanYouni
//
//  Created by jerry on 2022/9/13.
//

import SwiftUI
import ActivityView

struct ShareView: View {
    @State private var item: ActivityItem?
    var body: some View {
        Button {
                item = ActivityItem(
                    items: "This will be shared"
                )
            } label: {
                Text("Share")
            }
            .activitySheet($item)
    }
}

struct ShareView_Previews: PreviewProvider {
    static var previews: some View {
        ShareView()
    }
}
