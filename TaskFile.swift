//
//  TaskFile.swift
//  ListViewApp
//
//  Created by 渋谷柚花 on 2020/09/06.
//  Copyright © 2020 渋谷柚花. All rights reserved.
//

import Foundation
import SwiftUI
//他のところとの接続
import Combine

struct Task: Identifiable {
    var id = String()
    var taskItem = String()
}

class TaskList: ObservableObject{
    @Published var tasks = [Task]()
}



class namesList: ObservableObject {
    
    @Published var names:[String] =
        ["米倉","川田","磯部","渋谷","加藤"]
    
}
