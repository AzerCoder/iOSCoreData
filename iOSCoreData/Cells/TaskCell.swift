//
//  TaskCell.swift
//  iOSCoreData
//
//  Created by A'zamjon Abdumuxtorov on 29/12/23.
//

import SwiftUI

struct TaskCell: View {
    @State var student: Student
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        
        VStack(alignment:.leading,spacing: 8){
            HStack{
                Text(student.firstname!)
                Text(student.lastname!)
                Spacer()
                Text(student.gender!).foregroundColor(.red)
                Button(action: {
                    moc.delete(student)
                }, label: {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                })
            }
            HStack{
                Text(student.phone!).font(.system(size: 16))
                Text("|")
                Text(student.email!).font(.system(size: 16))
            }
            Text(student.address!)
        }.padding(.horizontal)
        
    }
}

#Preview {
    TaskCell(student: Student())
}
