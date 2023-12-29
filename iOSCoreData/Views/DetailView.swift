//
//  DetailView.swift
//  iOSCoreData
//
//  Created by A'zamjon Abdumuxtorov on 29/12/23.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentation
    @Environment(\.managedObjectContext) var moc
    
    @State var firstname: String
    @State var lastname:String
    @State var gender:String
    @State var phone:String
    @State var email:String
    @State var address:String
    let genders = ["Male","Famale"]
    
    func saveTask(firstname: String,lastname:String,gender:String,phone:String,email:String,address:String){
        let student = Student(context: self.moc)
        student.id = UUID()
        student.phone = phone
        student.email = email
        student.address = address
        student.firstname = firstname
        student.lastname = lastname
        student.gender = gender
        try? self.moc.save()
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Firstname", text: $firstname)
                    TextField("Lastname", text: $lastname)
                    Picker("Gender", selection: $gender, content: {
                        ForEach(genders, id: \.self){
                            Text($0)
                        }
                    })
                }
                Section{
                    TextField("Phone", text: $phone)
                    TextField("Email", text: $email)
                    TextField("Address", text: $address)
                    
                }
            }
            .navigationBarItems(trailing:
            Button(action: {
                saveTask(firstname: firstname, lastname: lastname, gender: gender, phone: phone, email: email, address: address)
                presentation.wrappedValue.dismiss()
            }, label: {
                Text("Add")
            })
            )
            .navigationBarTitle("Add Student",displayMode: .inline)
        }
    }
}

#Preview {
    DetailView(firstname: "", lastname: "", gender: "", phone: "", email: "", address: "")
}
