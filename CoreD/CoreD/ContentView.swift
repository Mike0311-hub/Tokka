//
//  ContentView.swift
//  CoreD
//
//  Created by Mike on 2020/10/04.
//

import SwiftUI
import CoreData
struct ContentView: View {
    var body: some View {
        NavigationView{
            Home().navigationTitle("To Do")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    @StateObject var model = dataModel()
    var body: some View{
        VStack{
            List{
                ForEach(model.data, id:\.objectID){ obj in
                    
                    Text(model.getValue(obj: obj))
                        .onTapGesture{model.openUpdateView(obj: obj)}
                }
                .onDelete(perform: model.deleteData(indexSet:)
                )
            }
            .listStyle(InsetGroupedListStyle())
            HStack(spacing: 15){
                
                TextField("Data Here", text: $model.txt)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
            Button(action: model.wirteData) {
                Text("Save")
            }
            }.padding()
        }
        .sheet(isPresented: $model.isUpdate){
            UpdateView(model: model)
        }
    }
}

struct UpdateView : View {
    @ObservedObject var model : dataModel
    
    var body: some View{
        VStack(spacing: 20){
            TextField("Update Here", text: $model.updateTxt)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: model.updateData){
                
                Text("Update")
            }
        }.padding()
    }
}

class dataModel : ObservableObject{
    @Published var data : [NSManagedObject] = []
    @Published var txt = ""
    @Published var isUpdate = false
    @Published var updateTxt = ""
    @Published var selectedObj = NSManagedObject()
    let context = persistentContainer.viewContext
    
    
    init() {
        readData()
    }
    
    func readData(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Data")
        
        do{
            let results = try context.fetch(request)
            
            self.data = results as! [NSManagedObject]
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    func wirteData(){
        //データの書き込み
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Data", into: context)
        
        entity.setValue(txt, forKey: "value")
        
        do {
            try context.save()
            //成功したらリストにデータを追加していく
            self.data.append(entity)

            txt = ""
        }
        catch{
            
        }
    }
    
    func deleteData(indexSet : IndexSet){
        
        //データ削除
        do{
            for index in indexSet{
                let obj = data[index]
                
                context.delete(obj)
                
                try context.save()
                
                //成功した時データをリストから削除する
                let index = data.firstIndex(of: obj)
                
                data.remove(at: index!)
            }
        }
        catch{
            print(error.localizedDescription)
        }
       
    }
    
    func updateData(){
        let index = data.firstIndex(of: selectedObj)
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Data")
        
        do{
            let results = try context.fetch(request) as![NSManagedObject]
            
            let obj = results.first{ (obj) -> Bool in
                if obj == selectedObj{return true}
                else{return false}
            }
            
            obj?.setValue(updateTxt, forKey: "value")
            
            try context.save()
            
            data[index!] = obj!
            
            isUpdate.toggle()
            updateTxt = ""
        }
        catch{
            print(error.localizedDescription)
        }
    }
    func getValue(obj : NSManagedObject) -> String{
        return obj.value(forKey: "value") as! String
    }
    
    func openUpdateView(obj: NSManagedObject){
        selectedObj = obj
        isUpdate.toggle()
    }
}
