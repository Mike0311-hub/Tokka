//
//  ContentView.swift
//  Tokka
//
//  Created by Mike on 2020/07/09.
//  Copyright © 2020 Mike. All rights reserved.
//

import SwiftUI
import CoreData


struct ContentView: View {
    @State var index = "Home"
    @State var show = false
    @State var Geometx: [String:CGFloat] = ["0" :0,"1" :0,"2" :0,"3" :0,"4" :0,"5" :0,"6" :0,"7" :0,"8" :0,"9" :0,"10" :0,"11" :0,"12" :0,"13" :0,"14":0,"15":0,"16":0,"17":0,"18":0,"19":0,"20":0,"21":0,"22":0,"23":0,"24":24]
    @State var Geomety: [String:CGFloat] = ["0" :0,"1" :0,"2" :0,"3" :0,"4" :0,"5" :0,"6" :0,"7" :0,"8" :0,"9" :0,"10" :0,"11" :0,"12" :0,"13" :0,"14":0,"15":0,"16":0,"17":0,"18":0,"19":0,"20":0,"21":0,"22":0,"23":0,"24":0]
    @State var currentdate : Date = Date()
    var body: some View {
        ZStack{
            (self.show ? Color.black.opacity(0.05): Color.clear).edgesIgnoringSafeArea(.all)
            ZStack(alignment: .leading){
                VStack(alignment: .leading, spacing: 25){
                    Image("pic")
                    .resizable()
                    .frame(width: 65, height: 65)
                    
                    ForEach(pagedata, id: \.self){ i in
                        Button(action: {
                            self.index = i
                            withAnimation(.spring()){
                                self.show.toggle()
                            }
                        }){
                            HStack{
                                Capsule()
                                    .fill(self.index == i ? Color.orange : Color.clear)
                                    .frame(width: 5,height: 30)
                                Text(i).padding(.leading).foregroundColor(.black)
                            }.padding(.vertical)
                        }
                    }
                    Spacer()
                }
                .padding(.leading)
                .padding(.top)
                .scaleEffect(self.show ? 1 : 0)
                
                ZStack(alignment: .topTrailing){
                    CustomNavivar(show: self.$show, index: self.$index, Geometx: self.$Geometx, Geomety: self.$Geomety, currentdate: self.$currentdate)
                    .offset(x: self.show ? 150 : 0)
                    .disabled(self.show ? true : false)
                    
                }
            }
        }
        
    }
}
class ItemData: ObservableObject {
     @Published var newItem : String = ""
    @Published var texton : Bool = false
    @Published var rerode : Bool = false
    @Published var Geometryx: [String:CGFloat] = ["0" :0,"1" :0,"2" :0,"3" :0,"4" :0,"5" :0,"6" :0,"7" :0,"8" :0,"9" :0,"10" :0,"11" :0,"12" :0,"13" :0,"14":0,"15":0,"16":0,"17":0,"18":0,"19":0,"20":0,"21":0,"22":0,"23":0,"24":24]
    @Published var Geometryy: [String:CGFloat] = ["0" :0,"1" :0,"2" :0,"3" :0,"4" :0,"5" :0,"6" :0,"7" :0,"8" :0,"9" :0,"10" :0,"11" :0,"12" :0,"13" :0,"14":0,"15":0,"16":0,"17":0,"18":0,"19":0,"20":0,"21":0,"22":0,"23":0,"24":0]
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct Home: View {
    @EnvironmentObject var item : ItemData
    @State var date = Date()
    @State var data : DateType!
    @State var toDoList: [String] = []
    @State var Daytimes = ["0" :" ","1" :" ","2" :" ","3" :" ","4" :" ","5" :" ","6" :" ","7" :" ","8" :" ","9" :" ","10" :" ","11" :" ","12" :" ","13" :" ","14":" ","15":" ","16":" ","17":" ","18":" ","19":" ","20":" ","21":" ","22":" ","23":" ","24":" "]
    @Binding var Geometx : [String:CGFloat]
    @Binding var Geomety : [String:CGFloat]
    @State var Section:String = ""
    @State var intSection: Int = 0
    @State var timeaction: Double = 0
    @State var former:[String] = ["0","0"]
    @State var oneformer: Int = 0
    @State var zeroformer: Int = 0
    @State private var showingAlert = false
    @State private var isShowingAlert = false
    @State private var alertInput = ""
    @State var newItem = ""
    @State var Geo = 0
    @State var takasa:CGFloat = 0
    @State var one: [Int] = []
    @State var counter : Int = 0
    @State var Liston : Bool = false
    @State var start : [Int] = []
    @State var todayTasks : [String] = []
    @State var todayTasksStart : [Int32] = []
    @State var todayTasksHeght : [Int32] = []
    @State var getfirst = false
    @State var show = false
    @State var Monday = ["公民","システム工学","情報工学実験"]
    @State var Tuesday = ["数学","公民","体育"]
    @State var Wednesday = ["論理回路","国語","数学１"]
    @State var Thursday = ["総合英語","情報理論","数学特論","特別活動"]
    @State var Friday = ["アルゴリズム","プログラミング応用","電気電子工学"]
    @State var getucount = ["9","11","13"]
    @State var mokucount = ["9","11","13","15"]
    @State var youbicou = ""
    @State var currentdate : Date
    var body : some View{
            GeometryReader{ bodyview in

                   
                
                    
                
                ScrollView{
                    ZStack {
                        VStack {
                            ForEach(0..<25){ dayaxis in
                                            Button(action: {
                                                self.Section = "\(dayaxis)"
                                                self.timeaction += 1
                                                if (self.timeaction).truncatingRemainder(dividingBy: 2.0) == 0{
                                                        self.oneformer = Int(self.Section)!
                                                        self.showingAlert = true
                                                        self.timeaction = 0
                                                    }
                                                else{
                                                    self.zeroformer = Int(self.Section)!
                                                }
                                            }) {
                                                    GeometryReader{ geometry in
                                                            HStack{
                                                                Text("\(dayaxis):00 ~   ").fontWeight(.bold)
                                                                    Spacer()
                                                               
                                                            }.onAppear{
                                                                self.Geometx["\(dayaxis)"] = geometry.frame(in: .global).origin.x
                                                                self.Geomety["\(dayaxis)"] = geometry.frame(in: .global).origin.y
                                                            }
                                                            
                                                    }.foregroundColor(Color.black).frame(width: bodyview.size.width).padding()
                                            }
                            }
                        }
                        
                        if self.Liston{
                            ZStack{
                                TaskView(Geometx: self.$Geometx, Geomety: self.$Geomety)
                            }.onAppear{
                                self.getTask()
                            }
                            
                        }
                        if self.getfirst{
                            ZStack{
                                TaskView(Geometx: self.$Geometx, Geomety: self.$Geomety)
                            }.onAppear{
                                self.getTask()
                            }
                        }
                        
                        if self.data != nil{
                        
                            if self.data.Date == "Monday"{
                                ForEach(0 ..< self.Monday.count){ getuyou in
                                    Text(self.Monday[getuyou]).frame(width : 150,height: 80).border(Color.black).position(x: self.Geometx["\(self.getucount[getuyou])"]!+200, y: self.Geomety["\(self.getucount[getuyou])"]!-30)
                                }
                            }
                            else if self.data.Date == "Tuesday"{
                                ForEach(0 ..< self.Tuesday.count){ kayou in
                                    Text(self.Tuesday[kayou]).frame(width : 150,height: 80).border(Color.black).position(x: self.Geometx["\(self.getucount[kayou])"]!+200, y: self.Geomety["\(self.getucount[kayou])"]!-30)
                                }
                            }
                            else if self.data.Date == "Wednesday"{
                                ForEach(0 ..< self.Wednesday.count){ sui in
                                    Text(self.Wednesday[sui]).frame(width : 150,height: 80).border(Color.black).position(x: self.Geometx["\(self.getucount[sui])"]!+200, y: self.Geomety["\(self.getucount[sui])"]!-30)
                                }
                            }
                            else if self.data.Date == "Thursday"{
                                ForEach(0 ..< self.Thursday.count){ moku in
                                    Text(self.Thursday[moku]).frame(width : 150,height: 80).border(Color.black).position(x: self.Geometx["\(self.mokucount[moku])"]!+200, y: self.Geomety["\(self.mokucount[moku])"]!-30)
                                }
                            }
                            else if self.data.Date == "Friday"{
                                ForEach(0 ..< self.Friday.count){ kin in
                                    Text(self.Friday[kin]).frame(width : 150,height: 80).border(Color.black).position(x: self.Geometx["\(self.mokucount[kin])"]!+200, y: self.Geomety["\(self.mokucount[kin])"]!-30)
                                }
                            }
                                
                            
                        }
                        

                }
                }.padding(.leading).opacity(self.showingAlert ? 0.5 : 1)
                .onAppear {
                    self.UpdateDate()
                self.getTask()
                    self.getfirst = true
                    
                }
                
                VStack{
                    if(self.showingAlert){
                     ZStack{
                         Rectangle().fill(Color.gray).frame(maxWidth: .infinity, maxHeight: .infinity).opacity(0.5)
                        customAlertView(todayTasks:self.$todayTasks, todayTasksHeght: self.$todayTasksHeght, todayTasksStart: self.$todayTasksStart, shown: self.$showingAlert, firstitem: self.$newItem, Daytime: self.$Daytimes, zeroform: self.$zeroformer, oneform: self.$oneformer, Sec: self.$Section, One: self.$one, onlist: self.$Liston, counter: self.$counter, start: self.$start, currentdate: self.$currentdate)
                     }
                    }
                }
            }
    }
    
    func DeleteOldTasks(){
           let app = UIApplication.shared.delegate as! AppDelegate
                  
           let context = app.persistentContainer.viewContext
           
           let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
           
           do{
               let result = try context.fetch(req)
               
               
               for i in result as! [NSManagedObject]{
                   let date = i.value(forKey: "date") as! Date
                   
                   let formatter = DateFormatter()
                   formatter.dateFormat = "dd-MM-YYYY"
                   
                   if formatter.string(from: date) < formatter.string(from: Date()){
                       context.delete(i)
                       
                       try context.save()
                   }
                   
               }
           }
           catch{
               print(error.localizedDescription)
           }
       }
    
    func DeleteTask(task : Int){
        let app = UIApplication.shared.delegate as! AppDelegate
               
        let context = app.persistentContainer.viewContext
        
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
        
        do{
            let result = try context.fetch(req)
            
            
            for i in result as! [NSManagedObject]{
                let currenttask = i.value(forKey: "task") as! String
             if self.todayTasks[task] == currenttask{
                 context.delete(i)
                 try context.save()
                 
                 self.todayTasks.remove (at : task)
                 self.todayTasksStart.remove(at: task)
                 self.todayTasksHeght.remove(at: task)
                 return
             }
            }
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    func UpdateDate(){
        let current = Calendar.current
        let monthNo = current.component(.month, from: self.date)
        let date = current.component(.day, from:self.date)
        let month = current.monthSymbols[monthNo-1]
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "EEEE", options: 0, locale: Locale.current)
        let datede = formatter.string(from: Date()) // 日
        self.data = DateType(Day: "\(date)", Month: month, Date: datede)
               
    }
    
    func getTask(){
           let app = UIApplication.shared.delegate as! AppDelegate
                  
           let context = app.persistentContainer.viewContext
           
           let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
           
           do{
               let result = try context.fetch(req)
               
               self.todayTasks.removeAll()
               self.todayTasksStart.removeAll()
               self.todayTasksHeght.removeAll()
               
               for i in result as! [NSManagedObject]{
                   let task = i.value(forKey: "task") as! String
                   let date = i.value(forKey: "date") as! Date
                   let start = i.value(forKey: "start") as! Int32
                   let height = i.value(forKey: "height") as! Int32
                   
                   let formatter = DateFormatter()
                   formatter.dateFormat = "dd-MM-YYYY"
                   
                   if formatter.string(from: date) == formatter.string(from: Date()){
                       self.todayTasks.append(task)
                       self.todayTasksHeght.append(height)
                       self.todayTasksStart.append(start)
                       
                   }
              
                   
               }
           }
           catch{
               print(error.localizedDescription)
               print("getTaskerror")
           }
       }
    
}
struct TaskView : View{
    @EnvironmentObject var item : ItemData

    @State var todayTasks : [String] = []
    @State var todayTasksHeght : [Int32] = []
    @State var todayTasksStart : [Int32] = []
    @Binding var Geometx : [String:CGFloat]
    @Binding var Geomety : [String:CGFloat]
    var body: some View{
        ZStack{
            ForEach(0 ..< self.todayTasks.count, id: \.self){ tasks in
               ZStack{
                   HStack{
                       Text(self.todayTasks[tasks])
                           Button(action: {
                               self.DeleteTask(task: tasks)
                           }) {
                               Image(systemName: "checkmark.circle")
                               .resizable()
                               .frame(width:22 , height: 22)
                               .foregroundColor(.green)
                               .padding(.trailing, 10)

                           }
                   }
                   .frame(width: 150, height: CGFloat(exactly: 34 * self.todayTasksHeght[tasks])!)
                   .border(Color.black)
                   .position(x: self.Geometx["\(self.todayTasksStart[tasks])"]!+200, y: self.Geomety["\(self.todayTasksStart[tasks])"]!-20)
                   //座標の問題あり多分
               }
           }
        }.onAppear{
            self.getTask()
            }
       
    }
    func DeleteTask(task : Int){
        let app = UIApplication.shared.delegate as! AppDelegate
               
        let context = app.persistentContainer.viewContext
        
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
        
        do{
            let result = try context.fetch(req)
            
            
            for i in result as! [NSManagedObject]{
                let currenttask = i.value(forKey: "task") as! String
             if self.todayTasks[task] == currenttask{
                 context.delete(i)
                 try context.save()
                 
                 self.todayTasks.remove (at : task)
                 self.todayTasksStart.remove(at: task)
                 self.todayTasksHeght.remove(at: task)
                 return
             }
            }
        }
        catch{
            print(error.localizedDescription)
        }
    }
    func getTask(){
        let app = UIApplication.shared.delegate as! AppDelegate
               
        let context = app.persistentContainer.viewContext
        
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
        
        do{
            let result = try context.fetch(req)
            
            self.todayTasks.removeAll()
            self.todayTasksStart.removeAll()
            self.todayTasksHeght.removeAll()
            
            for i in result as! [NSManagedObject]{
                let task = i.value(forKey: "task") as! String
                let date = i.value(forKey: "date") as! Date
                let start = i.value(forKey: "start") as! Int32
                let height = i.value(forKey: "height") as! Int32
                
                let formatter = DateFormatter()
                formatter.dateFormat = "dd-MM-YYYY"
                
                if formatter.string(from: date) == formatter.string(from: Date()){
                    self.todayTasks.append(task)
                    self.todayTasksHeght.append(height)
                    self.todayTasksStart.append(start)
                    
                }
           
                
            }
        }
        catch{
            print(error.localizedDescription)
            print("getTaskerror")
        }
    }
}

struct DateType {
    var Day: String
    var Month : String
    var Date : String
}
struct customAlertView : View{
    @Binding var todayTasks : [String]
    @Binding var todayTasksHeght : [Int32]
    @Binding var todayTasksStart : [Int32]
    @EnvironmentObject var object: ItemData
    @Binding var shown : Bool
    @Binding var firstitem : String
    @Binding var Daytime : [String:String]
    @Binding var zeroform : Int
    @Binding var oneform : Int
    @Binding var Sec : String
    @Binding var One : [Int]
    @Binding var onlist : Bool
    @Binding var counter : Int
    @Binding var start : [Int]
    @State var date = Date()
    @State var rectbool = 0
    @State var kazu = 0;
    @ObservedObject var item = ItemData()
    @Binding var currentdate : Date
    @Environment(\.presentationMode) var present

    var body: some View{
        
        ZStack{
            VStack {
                Spacer()
                HStack {
                        
                        Spacer()
                            Button(action: {
                                self.shown.toggle()
                            }){
                                Text("Cancel").frame(width: 55,height: 40).padding(8)
                            }.background(Color .white)
                                .foregroundColor(.blue)
                            Button(action: {
                                self.Daytime["\(self.zeroform)"] = "\(self.firstitem)"
                                self.kazu = abs(self.zeroform - self.oneform)+1
                                self.One.append(self.kazu)
                                self.start.append(self.zeroform)
                                self.saveTask()
                                self.firstitem = ""
                                self.Sec = ""
                                self.getTask()
                                self.onlist.toggle()
                                self.shown.toggle()
                            }){
                                Text("OK").frame(width: 55,height: 40).padding(8)
                            }.background(Color .white)
                                .foregroundColor(.blue)
                    Spacer()
                }
            }
            VStack{
                TextField("予定を追加、計画を守るように", text: $firstitem).textFieldStyle(RoundedBorderTextFieldStyle()).border(Color .white).frame(width: 280, height: 100)
                
            }

        }
        .onAppear{
            if self.onlist == true{
                self.onlist = false
            }
            
        }
        .frame(width: 280,height: 200)
            .background(Color .white)
            .cornerRadius(20)
        
    }
    func saveTask(){
        let app = UIApplication.shared.delegate as! AppDelegate
        
        let context = app.persistentContainer.viewContext
        
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Todo", into: context)
        entity.setValue(self.firstitem, forKey: "task")
        entity.setValue(self.zeroform, forKey: "start")
        entity.setValue(self.kazu, forKey: "height")
        entity.setValue(self.date, forKey: "date")
        
        do{
            try context.save()
            
            self.present.wrappedValue.dismiss()
            
            print("Success")
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    func getTask(){
        let app = UIApplication.shared.delegate as! AppDelegate
               
        let context = app.persistentContainer.viewContext
        
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
        
        do{
            let result = try context.fetch(req)
            
            self.todayTasks.removeAll()
            self.todayTasksStart.removeAll()
            self.todayTasksHeght.removeAll()
            
            for i in result as! [NSManagedObject]{
                let task = i.value(forKey: "task") as! String
                let date = i.value(forKey: "date") as! Date
                let start = i.value(forKey: "start") as! Int32
                let height = i.value(forKey: "height") as! Int32
                
                let formatter = DateFormatter()
                formatter.dateFormat = "dd-MM-YYYY"
                
                if formatter.string(from: date) == formatter.string(from: Date()){
                    self.todayTasks.append(task)
                    self.todayTasksHeght.append(height)
                    self.todayTasksStart.append(start)
                    
                }
                
            }
        }
        catch{
            print(error.localizedDescription)
            print("getTaskerror")
        }
    }
    
    
}

struct  CustomNavivar : View{
    @State var date = Date()
    @State var data : DateType!
    @Binding var show : Bool
    @Binding var index : String
    @Binding var Geometx : [String:CGFloat]
    @Binding var Geomety : [String:CGFloat]
    @Binding var currentdate : Date
    var body: some View{
        VStack(spacing: 0){
            ZStack{
                
                HStack{
                    
                    Button(action: {
                        
                        withAnimation(.spring()){
                            
                            self.show.toggle()
                        }
                        
                    }) {
                        
                        Image("Menu")
                        .resizable()
                        .frame(width: 20, height: 15)
                        .foregroundColor(.black)
                    }
                    
                    Spacer()
                }
                
                if self.data != nil{
                      
                    HStack{
                        Spacer()
                        Button(action: {
                            
                            self.date = Calendar.current.date(byAdding: .day, value: -1, to: self.date)!
                            self.currentdate = self.date
                            self.UpdateDate()
                            
                        }) {
                            
                            Image(systemName: "arrow.left")
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                        Text(self.data.Month)
                            .font(.title)
                          .fontWeight(.bold)
                        Text(self.data.Day)
                            .font(.title)
                          .fontWeight(.bold)
                        Spacer()
                        
                        Button(action: {
                            
                            self.date = Calendar.current.date(byAdding: .day, value: 1, to: self.date)!
                            self.currentdate = self.date
                            self.UpdateDate()
                            
                        }) {
                            
                            Image(systemName: "arrow.right")
                                .foregroundColor(.black)
                        }
                        
                    }
                    
                    
               }
            }.padding(.horizontal)
            .padding(.vertical, 10)
            ZStack{
                Home(Geometx: self.$Geometx, Geomety: self.$Geomety, currentdate: self.currentdate).opacity(self.index == "Home" ? 1 : 0)
                
                Orders().opacity(self.index == "時間割" ? 1 : 0)
                
                WishList().opacity(self.index == "WishList" ? 1 : 0)
                
                SavesCards().opacity(self.index == "Saves Cards" ? 1 : 0)
                
                Setting().opacity(self.index == "Setting" ? 1 : 0)
                
                Help().opacity(self.index == "Help" ? 1 : 0)
            }
            }.background(Color.white)
            .cornerRadius(15)
            .onAppear{
                    self.UpdateDate()
            }
    }
        func UpdateDate(){
               let current = Calendar.current
               let monthNo = current.component(.month, from: self.date)
               let date = current.component(.day, from:self.date)
               let month = current.monthSymbols[monthNo-1]
               let formatter = DateFormatter()
               formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "EEEE", options: 0, locale: Locale.current)
               let datede = formatter.string(from: Date()) // 日
               self.data = DateType(Day: "\(date)", Month
                : month, Date: datede)
                      
           }
    
}

struct customOrdersAlert : View{
    @Binding var firstitem : String
    @Binding var show : Bool
    @Binding var zikanwari : [String]
    @Binding var genGemy : [CGFloat]
    @Binding var youbiGemx : [CGFloat]
    @Binding var y : Int
    @Binding var x : Int

   
    var body: some View{
        
        ZStack{
            VStack {
                Spacer()
                HStack {
                        
                        Spacer()
                            Button(action: {
                                self.show.toggle()
                            }){
                                Text("Cancel").frame(width: 55,height: 40).padding(8)
                            }.background(Color .white)
                                .foregroundColor(.blue)
                    
                    
                            Button(action: {
                                self.show.toggle()
                            }){
                                Text("OK").frame(width: 55,height: 40).padding(8)
                            }.background(Color .white)
                                .foregroundColor(.blue)
                    Spacer()
                }
            }
            VStack{
                TextField("予定を追加、計画を守るように", text: $firstitem).textFieldStyle(RoundedBorderTextFieldStyle()).border(Color .white).frame(width: 280, height: 100)
                
            }

        }
//        .onAppear{
//            if self.onlist == true{
//                self.onlist = false
//            }
//
//        }
        .frame(width: 280,height: 200)
            .background(Color .white)
            .cornerRadius(20)
        
    }
}
struct  Orders : View{
    @State var youbi = ["月","火","水","木","金"]
    @State var gen = ["1","2","3","4","5","6","7","8"]
    @State var itigen = 0
    @State var nigen = 0
    @State var selectyoubi = ""
    @State var cou = 0.0
    @State var countgen = 0
    @State var show = false
    @State var youbiGemx : [CGFloat] = []
    @State var genGemy : [CGFloat] = []
    @State var zikanwari : [String] = []
    @State var firstitem = ""
    @State var x = 0
    @State var y = 0
    @State var getu = ["公民","システム工学","情報工学実験"]
    @State var kayou = ["数学","公民","体育"]
    @State var sui = ["論理回路","国語","数学１"]
    @State var moku = ["総合英語","情報理論","数学特論","特別活動"]
    @State var kin = ["アルゴリズム","プログラミング応用","電気電子工学"]
    @State var youbizahyou = 1
    var body: some View{
        
        Group {
            ScrollView {
                ZStack{
                    HStack{
                        ForEach(0 ..< youbi.count){ a in
                            Button(action: {
                                self.selectyoubi = self.youbi[a]
                                self.x = a
                            }) {
                                
                                GeometryReader { geometry in
                                    HStack{
                                        Text("\(self.youbi[a])")
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                        Spacer()
                                    }.onAppear{
                                        self.youbiGemx.append(geometry.frame(in: .global).origin.x)
                                    }
                                }
                            }
                            
                        }
                    }.padding(.leading, 80)
                    VStack {
                        ForEach(1 ..< 9){ i in
                                Button(action: {
                                    self.y = i
                                    self.countgen = i
                                    self.cou += 1
                                    if (self.cou).truncatingRemainder(dividingBy: 2.0) == 0{
                                        self.nigen = self.countgen
                                        self.show = true
                                        self.cou = 0
                                        
                                    }
                                    else{
                                        self.itigen = self.countgen
                                    }
                                }) {
                                    
                                    HStack {
                                        
                                            VStack{
                                                Text("\(i)限").fontWeight(.bold).foregroundColor(.black)
                                                
                                                Spacer(minLength: 20)
                                                }
                                            Spacer()
                                        }
                                        
                                    
                                }
                               
                        }
                    }.padding(.top, 30)
                    
                    ForEach(0 ..< getu.count){ getuyou in
                        VStack{
                             Text(self.getu[getuyou])
                                .position(x: 80 , y:60 + CGFloat(80 * getuyou))
                        }
                       
                    }
                    ForEach(0 ..< kayou.count){ kayoubi in
                        VStack{
                             Text(self.kayou[kayoubi]).position(x: 150 , y:60 + CGFloat(80 * kayoubi))
                        }
                       
                    }
        
    //                if (show == false){
    //                    ForEach(0 ..< youbiGemx.count){ zikanwari in
    //                        Text(self.zikanwari[zikanwari])
    //                            .position(x: self.youbiGemx[zikanwari] , y: self.genGemy[zikanwari])
    //                    }
    //                }
                    
                     
                    
                 
                }
            }.padding(.top ,50).opacity(self.show ? 0.5 : 1)
            VStack{
                ZStack{
                    if(show){
                        Rectangle().fill(Color.gray).frame(maxWidth: .infinity, maxHeight: .infinity).opacity(0.5)
                        customOrdersAlert(firstitem: self.$firstitem, show: self.$show, zikanwari: self.$zikanwari, genGemy: self.$genGemy, youbiGemx: self.$youbiGemx, y: self.$y, x: self.$x)
                        
                    }
                }
                
            }
        }
        
        
    }
}
struct  WishList : View{
    @State var todayTasks : [String] = []
    @State var todayTasksStart : [Int32] = []
    @State var todayTasksHeght : [Int32] = []
    @State var todayTasksDate : [String] = []
    @State var joutai = false
    @State var non = 0
    @ObservedObject var user = ItemData()
    var body: some View{
        VStack{
            Button(action: {
                self.getTask()
                self.user.rerode = true
            }) {
                Text("更新")
            }
       List{
           ForEach(0 ..< self.todayTasks.count, id: \.self){ tasks in
                   ZStack{
                       HStack{
                           Text(self.todayTasks[tasks])
                        Spacer()
                            Text("\(self.todayTasksDate[tasks])")
                               Button(action: {
                                   self.DeleteTask(task: tasks)
                                self.user.rerode = true
                               }) {
                                   Image(systemName: "checkmark.circle")
                                   .resizable()
                                   .frame(width:22 , height: 22)
                                   .foregroundColor(.green)
                                   .padding(.trailing, 10)

                               }
                       }
                       
                   }
               }
       }
        }.onAppear{
            self.getTask()
        }
    }
    func DeleteTask(task : Int){
        let app = UIApplication.shared.delegate as! AppDelegate
               
        let context = app.persistentContainer.viewContext
        
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
        
        do{
            let result = try context.fetch(req)
            
            
            for i in result as! [NSManagedObject]{
                let currenttask = i.value(forKey: "task") as! String
             if self.todayTasks[task] == currenttask{
                 context.delete(i)
                 try context.save()
                 
                 self.todayTasks.remove (at : task)
                 self.todayTasksStart.remove(at: task)
                 self.todayTasksHeght.remove(at: task)
                 return
             }
            }
        }
        catch{
            print(error.localizedDescription)
        }
    }
    func getTask(){
        let app = UIApplication.shared.delegate as! AppDelegate
               
        let context = app.persistentContainer.viewContext
        
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
        
        do{
            let result = try context.fetch(req)
            
            self.todayTasks.removeAll()
            self.todayTasksStart.removeAll()
            self.todayTasksHeght.removeAll()
            
            for i in result as! [NSManagedObject]{
                let task = i.value(forKey: "task") as! String
                let date = i.value(forKey: "date") as! Date
                let start = i.value(forKey: "start") as! Int32
                let height = i.value(forKey: "height") as! Int32
                

                let formatter = DateFormatter()
                formatter.locale = Locale(identifier: "ja_JP")
                formatter.setLocalizedDateFormatFromTemplate("MMMdE")
                    self.todayTasks.append(task)
                    self.todayTasksHeght.append(height)
                    self.todayTasksStart.append(start)
                self.todayTasksDate.append(formatter.string(from: date))
                
           
                
            }
        }
        catch{
            print(error.localizedDescription)
            print("getTaskerror")
        }
    }
}
struct  SavesCards : View{
    var body: some View{
        GeometryReader{_ in
            VStack{
                Text("Saves Cards")
            }
        }
    }
}
struct  Setting : View{
    var body: some View{
        GeometryReader{_ in
            VStack{
                Text("Setting")
            }
        }
    }
}
struct  Help : View{
    var body: some View{
        GeometryReader{_ in
            VStack{
                Text("help")
            }
        }
    }
}
var pagedata = ["Home","時間割","WishList","Saves Cards","Setting","Help"]
