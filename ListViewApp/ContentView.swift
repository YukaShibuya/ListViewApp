//
//  ContentView.swift
//  ListViewApp
//
//  Created by 渋谷柚花 on 2020/09/06.
//  Copyright © 2020 渋谷柚花. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    
    
    @ObservedObject var nList = namesList()
    
    @ObservedObject var tList = TaskList()
    
    @State var newTask : String = ""
    
    
    var addTaskBar : some View{
        HStack{
            TextField("追加してください",text:self.$newTask)
            //ボタンを押したらこのアクションが発動
            Button(action: self.addNewTask, label: {Text("add")})
        }
    }
    
   
    
    func addNewTask() {
        tList.tasks.append(Task(id: String(tList.tasks.count + 1), taskItem: newTask))
        self.newTask = ""
    }
    
    func rowRemove(offsets: IndexSet) {
              tList.tasks.remove(atOffsets: offsets)
          }
    
    
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                addTaskBar.padding()
                List {
                ForEach(self.tList.tasks){Index in Text(Index.taskItem)
                    } .onDelete(perform: rowRemove)
                
                }.navigationBarTitle("Taskリスト")
                
            }.navigationBarItems(trailing: EditButton())
        }
    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
