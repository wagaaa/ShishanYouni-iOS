//
//  CalendarView.swift
//  ShishanYouni
//
//  Created by jerry on 2022/9/15.
//

import SwiftUI
import UIKit


struct CalendarView: View {
    var body: some View{
        NavigationView{
            storyBoardView().edgesIgnoringSafeArea(.all)
            .navigationTitle("课表")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: AddButton())
        }
    }
}

struct storyBoardView: UIViewControllerRepresentable{
    func makeUIViewController(context: Context) -> some UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier: "TimeTable")
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct AddButton: View {
    var body: some View {
        Label("Add", image: "plus")
    }
}

struct DateBar: View {
    let rows = [GridItem(), GridItem()]
    let weeks = ["一","二","三","四","五","六","日"]
    var body: some View {
        LazyHGrid(rows: rows) {
            ForEach(0...6, id: \.self){ day in
                Text(weeks[day])
            }
        }
    }
}

struct HorizontalSmileys: View {
    let rows = [GridItem(.fixed(30)), GridItem(.fixed(30))]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                
            }
        }
    }

    private func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
