//
//  ContentView.swift
//  iOSCoreData
//
//  Created by A'zamjon Abdumuxtorov on 29/12/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var isModal: Bool = false
    @FetchRequest(entity: Student.entity(), sortDescriptors: []) var student: FetchedResults<Student>
    
    var body: some View {
        NavigationView{
            List{
                ForEach(student,id:\.id){ student in
                      TaskCell(student: student)
                }
            }.listStyle(PlainListStyle())
                .navigationBarTitle("Student List",displayMode: .inline)
                .navigationBarItems(trailing:
                                        Button(action: {
                                            self.isModal = true
                                        }, label: {
                                            Text("Add")
                                        }).sheet(isPresented: $isModal, content: {
                                            DetailView(firstname: "", lastname: "", gender: "", phone: "", email: "", address: "")
                                        })
                )
        }
    }
}



#Preview {
    ContentView()
}
