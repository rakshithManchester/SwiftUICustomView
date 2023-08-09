//
//  ContentView.swift
//  CollapsibleProjectTwo
//
//  Created by Appaiah on 07/08/23.
//

import SwiftUI

enum ButtonStatus: String {
    case expand = "Expand"
    case hide = "Hide"
}

struct ContentView: View {
    
    @State var fruitList = ["Apple", "Mangoes", "Orange", "Banana", "Grapes"]
    @State var VegetableList = ["Parrot", "Beans", "BeansOne", "Potato", "Tomato"]
    @State var vegButtonState: ButtonStatus = .expand
    @State var fruitButtonState: ButtonStatus = .expand
    
    var body: some View {
        VStack {
            List {
                Section(header: HeaderView(headerTitle: "Section One",listVisibilityStatus: $fruitButtonState, rightCollapseImgStr: "arrow.down.and.line.horizontal.and.arrow.up", systemImageFlag: true, collapseImgString: "arrow.down.and.line.horizontal.and.arrow.up",expandImgString: "arrow.up.and.line.horizontal.and.arrow.down")) {
                    if fruitButtonState == .expand {
                        ForEach(fruitList,id: \.self) { fruit in
                            Text(fruit)
                        }
                    } else {
                        EmptyView()
                    }
                }
                Section(header: HeaderView(headerTitle: "123456 ",listVisibilityStatus: $vegButtonState, rightCollapseImgStr: "gearshape", systemImageFlag: false, collapseImgString: "gearshape",expandImgString: "line.3.crossed.swirl.circle")) {
                    if vegButtonState == .expand {
                        ForEach(VegetableList,id: \.self) { vegetable in
                            Text(vegetable)
                        }
                    }
                    else {
                        EmptyView()
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HeaderView: View {
    @State var headerTitle: String
    @Binding var listVisibilityStatus: ButtonStatus
    @State var rightCollapseImgStr: String
    @State var collapse: Bool = false
    
    var systemImageFlag: Bool
    var collapseImgString: String
    var expandImgString: String
    
    var body: some View {
        HStack {
            Text("\(headerTitle)")
            Spacer()
            switch systemImageFlag {
            case true :
                Image(systemName: rightCollapseImgStr)
                    .onTapGesture {
                        imageFlutuate()
                        listFlutuate()
                    }
            default:
                Image(rightCollapseImgStr)
                    .background(Color.red)
                    .onTapGesture {
                        if collapse {
                            rightCollapseImgStr = collapseImgString
                            collapse = false
                        } else {
                            rightCollapseImgStr = expandImgString
                            collapse = true
                        }
                        
                        listFlutuate()
                    }
            }
        }
    }
    
    func imageFlutuate() {
        if collapse {
            rightCollapseImgStr = collapseImgString
            collapse = false
        } else {
            rightCollapseImgStr = expandImgString
            collapse = true
        }
    }
    
    func listFlutuate() {
        self.listVisibilityStatus = listVisibilityStatus.rawValue == "Hide"
        ? .expand : .hide
    }
}
